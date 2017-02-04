//
//  RefreshComponent.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/18.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshComponent.h"

@interface RefreshComponent ()

@property (strong, nonatomic) UIPanGestureRecognizer *pan;

@end

NSString *const RefreshKeyPathContentOffset = @"contentOffset";
NSString *const RefreshKeyPathContentInset = @"contentInset";
NSString *const RefreshKeyPathContentSize = @"contentSize";
NSString *const RefreshKeyPathPanState = @"state";

@implementation RefreshComponent

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        self.state = RefreshStateIdle;
    }
    return self;
}

- (void)prepare {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self placeSubViews];
}

- (void)placeSubViews{}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.state == RefreshStateWillRefresh) {
        self.state = RefreshStateRefreshing;
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) return;
    
    if (newSuperview) {
        self.ymj_w = newSuperview.ymj_w;
        self.ymj_x = 0;
        
        _scrollView = (UIScrollView *)newSuperview;
        _scrollView.alwaysBounceVertical = YES;
        [self addObserver];
    }
}

#pragma mark - KVO 监听ScrollView偏移和刷新状态
- (void)addObserver {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentSize options:options context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:RefreshKeyPathPanState options:options context:nil];
}

- (void)removeObservers {
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentSize];;
    [self.pan removeObserver:self forKeyPath:RefreshKeyPathPanState];
    self.pan = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (!self.userInteractionEnabled) return;
 
    // 这个就算看不见也需要处理
    if ([keyPath isEqualToString:RefreshKeyPathContentSize]) {
        [self scrollViewContentSizeDidChange:change];
    }
    // 看不见
    if (self.hidden) return;
    if ([keyPath isEqualToString:RefreshKeyPathContentOffset]) {
        [self scrollViewContentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:RefreshKeyPathPanState]) {
        [self scrollViewPanStateDidChange:change];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change {}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{}


- (void)beginRefreshing {
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 1.0f;
    }];
    self.pullingPercent = 1.0f;
    if (self.window) {
        self.state = RefreshStateRefreshing;
    } else {
        self.state = RefreshStateWillRefresh;
        [self setNeedsDisplay];
    }
}

- (void)endRefreshing {
    self.state = RefreshStateIdle;
}

- (BOOL)isRefreshing {
    return self.state == RefreshStateRefreshing || self.state == RefreshStateWillRefresh;
}

@end
