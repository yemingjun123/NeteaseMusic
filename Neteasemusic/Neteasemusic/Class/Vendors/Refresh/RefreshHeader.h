//
//  RefreshHeader.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshComponent.h"

@interface RefreshHeader : RefreshComponent

+ (instancetype)headerWithRefreshingBlock:(RefreshComponentBlock) refreshingBlock;

@property (copy, nonatomic) NSString *lastUpdataTimeKey;  /** 上次刷新时间key */
@property (copy, nonatomic) NSDate *lastUpdataTime;       /** 上次刷新时间 */

@property (assign, nonatomic) CGFloat ignoredScrollViewContentInsetTop;

@end
