//
//  RefreshGIFHeader.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshStateHeader.h"

@interface RefreshGIFHeader : RefreshStateHeader

@property (weak, nonatomic, readonly) UIImageView *gifImageView;

- (void)setImages:(NSArray *)images forState:(RefreshState)state;

@end
