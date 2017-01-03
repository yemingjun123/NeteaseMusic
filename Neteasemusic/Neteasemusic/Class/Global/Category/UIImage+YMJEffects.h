//
//  UIImage+YMJEffects.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YMJEffects)

- (UIImage *)ymj_lightEffect;

- (UIImage *)ymj_extraLightEffect;

- (UIImage *)ymj_darkGrayEffect;

- (UIImage *)ymj_blurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
