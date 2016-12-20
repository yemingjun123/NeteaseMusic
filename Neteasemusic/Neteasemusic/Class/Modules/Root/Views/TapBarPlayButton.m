//
//  TapBarPlayButton.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "TapBarPlayButton.h"

UIImage *newImage(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

@interface TapBarPlayButton ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation TapBarPlayButton

- (instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
        [self addGestureRecognizer:single];
        [self setUI];
    }
    return self;
}

- (void)setUI {
    UIImage *image = newImage(@"cm2_topbar_icn_playing1.png");
    CGFloat imageViewX = (self.ymj_w - image.size.width) / 2;
    CGFloat imageViewY = (self.ymj_h - image.size.height) / 2;
    CGFloat imageViewW = image.size.width;
    CGFloat imageViewH = image.size.height;
    CGRect frame = CGRectMake(imageViewX , imageViewY,
        imageViewW , imageViewH);
    self.imageView = [[UIImageView alloc]initWithFrame:frame];
    self.imageView.image = image;
    self.imageView.animationImages = @[
                                       newImage(@"cm2_topbar_icn_playing1.png"),
                                       newImage(@"cm2_topbar_icn_playing2.png"),
                                       newImage(@"cm2_topbar_icn_playing3.png"),
                                       newImage(@"cm2_topbar_icn_playing4.png"),
                                       newImage(@"cm2_topbar_icn_playing5.png"),
                                       newImage(@"cm2_topbar_icn_playing6.png"),
                                       newImage(@"cm2_topbar_icn_playing5.png"),
                                       newImage(@"cm2_topbar_icn_playing4.png"),
                                       newImage(@"cm2_topbar_icn_playing3.png"),
                                       newImage(@"cm2_topbar_icn_playing2.png")
                                       ];
    self.imageView.animationDuration = 0.5f;
    self.imageView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.imageView];
}

- (void)startAnimation {
    [self.imageView startAnimating];
}

- (void)stopAnimation {
    [self.imageView stopAnimating];
}

@end
