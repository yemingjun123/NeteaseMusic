//
//  RefreshFooter.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshFooter.h"
#import "RefreshConst.h"

@implementation RefreshFooter

+ (instancetype)footerWithRefreshingBlock:(RefreshComponentBlock)refeshingBlock {
    RefreshFooter *cmp = [[RefreshFooter alloc]init];
    cmp.refreshingBlock = refeshingBlock;
    return cmp;
}

- (void)prepare {
    [super prepare];
    self.ymj_h = RefreshFooterHeight;
}

- (void)endRefreshingWithNoMoreData {
    self.state = RefreshStateNoMoreData;
}

- (void)resetNoMoreData {
    self.state = RefreshStateIdle;
}


@end
