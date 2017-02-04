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

@property (copy, nonatomic) NSString *lastUpdataTimeKey;

@property (copy, nonatomic) NSDate *lastUpdataTime;

//@property (copy, nonatomic) NSString *

@end
