//
//  RefreshAutoFooter.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/7.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshAutoFooter.h"

@implementation RefreshAutoFooter

-(void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        if (!self.hidden) {
            self.scrollView.ymj_insetB += self.ymj_h;
        }
        self.ymj_y = _scrollView.ymj_contentH;
    } else {
        if (!self.hidden) {
            self.scrollView.ymj_insetB -= self.ymj_h;
        }
    }
}

- (void)prepare {
    [super prepare];
    self.triggerAutomaticallyRefreshPercent = 1.0f;
    self.automaticallyRefresh = YES;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    if (self.state != RefreshStateIdle || self.ymj_y == 0) return;
    
    if (_scrollView.ymj_insetT + _scrollView.ymj_contentH > _scrollView.ymj_h) {
        if (_scrollView.ymj_offsetY >= _scrollView.ymj_contentH - _scrollView.ymj_h + self.ymj_h * self.triggerAutomaticallyRefreshPercent + _scrollView.ymj_insetB - self.ymj_h) {
            CGPoint old = [change[@"old"] CGPointValue];
            CGPoint new = [change[@"new"] CGPointValue];
            if (old.y <= new.y) return;
            [self beginRefreshing];
        }
    }
}

- (void)scrollViewPanStateDidChange:(NSDictionary *)change {
    [super scrollViewPanStateDidChange:change];
    if (self.state == RefreshStateIdle) return;
    if (_scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (_scrollView.ymj_insetT + _scrollView.ymj_contentH <= _scrollView.ymj_h) {  /** 不够一个屏幕 */
            if (_scrollView.ymj_offsetY >= - _scrollView.ymj_insetT) { /** 向上拽 */
                [self beginRefreshing];
            }
        } else { /** 超出一个屏幕 */
            if (_scrollView.ymj_offsetY >= _scrollView.ymj_contentH + _scrollView.ymj_insetB - _scrollView.ymj_h) {
                [self beginRefreshing];
            }
        }
    }
}

- (void)setState:(RefreshState)state {
    RefreshCheckState
    if (state == RefreshStateRefreshing) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self executeRefreshingCallback];
        });
    }
}


@end
