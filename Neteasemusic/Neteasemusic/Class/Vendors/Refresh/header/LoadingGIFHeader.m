//
//  LoadingGIFHeader.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/8.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "LoadingGIFHeader.h"

@implementation LoadingGIFHeader

- (void)prepare {
    [super prepare];

    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSInteger i = 1; i <= 3; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cm2_list_loading%ld", i]];
        [refreshingImages addObject:image];
    }
    for (NSInteger i = 4; i >= 1; i --) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cm2_list_loading%ld", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:RefreshStateRefreshing];
}

@end
