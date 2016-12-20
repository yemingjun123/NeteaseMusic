//
//  UIScrollView+YMJExtension.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/20.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YMJExtension)

@property (assign, nonatomic) CGFloat ymj_insetT;
@property (assign, nonatomic) CGFloat ymj_insetB;
@property (assign, nonatomic) CGFloat ymj_insetL;
@property (assign, nonatomic) CGFloat ymj_insetR;

@property (assign, nonatomic) CGFloat ymj_offsetX;
@property (assign, nonatomic) CGFloat ymj_offsetY;

@property (assign, nonatomic) CGFloat ymj_contentW;
@property (assign, nonatomic) CGFloat ymj_contentH;

@end
