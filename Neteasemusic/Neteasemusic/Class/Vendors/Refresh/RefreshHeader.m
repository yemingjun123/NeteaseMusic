//
//  RefreshHeader.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshHeader.h"
#import "RefreshConst.h"

@interface RefreshHeader ()

@property (assign, nonatomic) CGFloat insetTopDelt;

@end

@implementation RefreshHeader


+ (instancetype)headerWithRefreshingBlock:(RefreshComponentBlock)refreshingBlock {
    RefreshHeader *cmp = [[self alloc] init];
    cmp.refreshingBlock = refreshingBlock;
    return cmp;
}

- (void)prepare {
    [super prepare];
    self.lastUpdataTimeKey = RefreshHeaderLastUpdatedKey;
    self.ymj_h = RefreshHeaderHeight;
}

- (void)placeSubViews {
    [super placeSubViews];
    self.ymj_y = - self.ymj_h - self.ignoredScrollViewContentInsetTop;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    
    if (self.state == RefreshStateRefreshing) {
        if (self.window == nil) return;
        CGFloat insetTop = - self.scrollView.ymj_offsetY > _scrollViewOriginalInset.top ? -self.scrollView.ymj_offsetY  : _scrollViewOriginalInset.top;
        insetTop = insetTop > self.ymj_h + _scrollViewOriginalInset.top ? self.ymj_h + _scrollViewOriginalInset.top : insetTop;
        self.scrollView.ymj_insetT = insetTop;
        self.insetTopDelt = _scrollViewOriginalInset.top - insetTop;
        return;
    }
    
    _scrollViewOriginalInset = self.scrollView.contentInset;
    CGFloat offsetY = self.scrollView.ymj_offsetY;
    CGFloat happenOffsetY = - self.scrollViewOriginalInset.top;
    
    if (offsetY > happenOffsetY) return;
    
    CGFloat normalPullingOffsetY = happenOffsetY - self.ymj_h;
    
    if (self.scrollView.isDragging) {
        if (self.state == RefreshStateIdle && offsetY < normalPullingOffsetY) {
            self.state = RefreshStatePulling;
        } else if (self.state == RefreshStatePulling && offsetY >= normalPullingOffsetY) {
            self.state = RefreshStateIdle;
        }
    } else if (self.state == RefreshStatePulling) {
        [self beginRefreshing];
    }
}

- (void)setState:(RefreshState)state {
   RefreshCheckState
    if (state == RefreshStateIdle) {
        if (oldState != RefreshStateRefreshing) return;
        // 保存刷新时间
        UserDefaultSave([NSDate date], self.lastUpdataTimeKey);
        
        [UIView animateWithDuration:RefreshSlowAnimationDuration animations:^{
            self.scrollView.ymj_insetT += self.insetTopDelt;
        } completion:nil];
    } else if (state == RefreshStateRefreshing) {
        [UIView animateWithDuration:RefreshFastAnimationDuration animations:^{
            CGFloat top = self.scrollViewOriginalInset.top + self.ymj_h;
            self.scrollView.ymj_insetT = top;
            self.scrollView.ymj_offsetY = - top;
        } completion:^(BOOL finished) {
            [self executeRefreshingCallback];
        }];
    }
}



@end
