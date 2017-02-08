//
//  RefreshFooter.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshComponent.h"
#import "RefreshConst.h"

@interface RefreshFooter : RefreshComponent

@property (assign, nonatomic) CGFloat ignoredScrollViewContentInsetBottom;

+ (instancetype)footerWithRefreshingBlock:(RefreshComponentBlock)refeshingBlock;
- (void)endRefreshingWithNoMoreData;  /** 提示没有更多数据 */
- (void)resetNoMoreData;              /** 重置 */

@end
