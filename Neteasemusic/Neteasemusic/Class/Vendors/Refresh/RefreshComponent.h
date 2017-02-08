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

typedef void(^RefreshComponentBlock)();  /** 刷新的回调 */

@interface RefreshComponent : UIView {
    UIEdgeInsets _scrollViewOriginalInset;
    __weak UIScrollView *_scrollView;
}

@property (copy, nonatomic) RefreshComponentBlock refreshingBlock;
@property (assign, nonatomic) RefreshState state;
@property (weak, nonatomic, readonly) UIScrollView *scrollView;
@property (assign, nonatomic, readonly) UIEdgeInsets scrollViewOriginalInset;

- (void)beginRefreshing;
- (void)endRefreshing;
- (BOOL)isRefreshing;

- (void)executeRefreshingCallback;   /** 执行刷新的回调 */
- (void)prepare NS_REQUIRES_SUPER;
- (void)placeSubViews NS_REQUIRES_SUPER;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
- (void)scrollViewPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

@end

@interface UILabel (Refresh)

+ (instancetype)_label;

@end
