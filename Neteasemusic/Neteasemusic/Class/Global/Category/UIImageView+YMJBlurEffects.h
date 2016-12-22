//
//  UIImageView+YMJBlurEffects.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YMJBlurEffects)

- (void)setImageToBlur:(UIImage *)image blurRadius:(CGFloat)blurRadius;

- (void)setImageToBlur:(UIImage *)image;

@end
