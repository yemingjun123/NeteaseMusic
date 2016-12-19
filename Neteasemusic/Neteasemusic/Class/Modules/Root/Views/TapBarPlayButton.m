//
//  TapBarPlayButton.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "TapBarPlayButton.h"

@implementation TapBarPlayButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cm2_topbar_icn_playing" ofType:@"png"];
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    CGImageRef image = img.CGImage;
    CGContextSaveGState(context);
    CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, touchRect, image);
    CGContextRestoreGState(context);
}

- (void)shartAnimation {
    
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];

    animation.duration = 1.0f;
    
    animation.fromValue = @1;
    
    animation.toValue = @0;
    
    animation.repeatCount = MAXFLOAT;
    
}


@end
