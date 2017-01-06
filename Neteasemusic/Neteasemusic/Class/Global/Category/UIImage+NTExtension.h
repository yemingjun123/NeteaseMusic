//
//  UIImage+NTExtension.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NTExtension)


- (UIImage *)ymj_lightEffect;

- (UIImage *)ymj_extraLightEffect;

- (UIImage *)ymj_darkGrayEffect;

- (UIImage *)ymj_blurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

+ (UIImage *)imageWithColor:(UIColor *)color;


@end
