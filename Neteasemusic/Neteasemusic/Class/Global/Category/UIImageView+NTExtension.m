//
//  UIImageView+NTExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "UIImageView+NTExtension.h"
#import "UIImage+NTExtension.h"

CGFloat const kDefaultBlurRadius  = 20.0;
CGFloat const kDefaultSaturationDeltaFactor = 1.8;

@implementation UIImageView (NTExtension)


- (void)setImageToBlur:(UIImage *)image {
    [self setImageToBlur:image blurRadius:kDefaultBlurRadius];
}

- (void)setImageToBlur:(UIImage *)image blurRadius:(CGFloat)blurRadius {
    NSParameterAssert(image);
    blurRadius = (blurRadius <= 0) ? kDefaultBlurRadius : blurRadius;
    DISPATCH_ASYNS(^{
        UIImage *blurredImage = [image ymj_blurWithRadius:blurRadius tintColor:nil saturationDeltaFactor:kDefaultSaturationDeltaFactor maskImage:nil];
        DISPATCH_MAIN(^{
            self.image = blurredImage;
        });
    });
}


@end
