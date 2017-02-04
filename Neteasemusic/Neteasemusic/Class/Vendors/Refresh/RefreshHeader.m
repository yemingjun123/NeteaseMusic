//
//  RefreshHeader.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshHeader.h"

@implementation RefreshHeader


+ (instancetype)headerWithRefreshingBlock:(RefreshComponentBlock)refreshingBlock {
    RefreshHeader *cmp = [[self alloc] init];
    cmp.refreshingBlock = refreshingBlock;
    return cmp;
}

- s


@end
