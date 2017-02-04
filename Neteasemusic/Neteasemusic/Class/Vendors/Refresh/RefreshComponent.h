//
//  RefreshComponent.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/18.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RefreshState) {
    RefreshStateIdle,           /** 普通闲置状态 */
    RefreshStatePulling,        /** 松开就可以进行刷新的状态 */
    RefreshStateRefreshing,     /** 正在刷新中的状态 */
    RefreshStateWillRefresh,    /** 即将刷新的状态 */
    RefreshStateNoMoreData      /** 所有数据加载完毕，没有更多的数据了 */
};

typedef void(^RefreshComponentBlock)();

@interface RefreshComponent : UIView

@property (copy, nonatomic) RefreshComponentBlock refreshingBlock;
@property (assign, nonatomic) RefreshState state;
@property (weak, nonatomic, readonly) UIScrollView *scrollView;

- (void)beginRefreshing;
- (void)endRefreshing;
- (BOOL)isRefreshing;


- (void)prepare;
- (void)placeSubViews;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
- (void)scrollViewPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

@property (assign, nonatomic) CGFloat pullingPercent;
/** 根据拖拽比例自动切换透明度 */
@property (assign, nonatomic, getter=isAutomaticallyChangeAlpha) BOOL automaticallyChangeAlpha;

@end
