//
//  UIScrollView+NTExtension.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (NTExtension)

@property (assign, nonatomic) CGFloat ymj_insetT;
@property (assign, nonatomic) CGFloat ymj_insetB;
@property (assign, nonatomic) CGFloat ymj_insetL;
@property (assign, nonatomic) CGFloat ymj_insetR;

@property (assign, nonatomic) CGFloat ymj_offsetX;
@property (assign, nonatomic) CGFloat ymj_offsetY;

@property (assign, nonatomic) CGFloat ymj_contentW;
@property (assign, nonatomic) CGFloat ymj_contentH;

@end
