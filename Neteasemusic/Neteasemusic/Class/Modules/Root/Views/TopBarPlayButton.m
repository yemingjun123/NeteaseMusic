//
//  TapBarPlayButton.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "TopBarPlayButton.h"

UIImage *newImage(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

@interface TopBarPlayButton ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation TopBarPlayButton

SINGLETON_M_CLASS(TopBarPlayButton)

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 44, 44);
        [self setUI];
    }
    return self;
}

- (void)setUI {
    UIImage *image = newImage(@"cm2_topbar_icn_playing1.png");
    CGFloat imageViewX = (self.ymj_w - image.size.width); 
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
    self.imageView.animationDuration = 1.0f;
    self.imageView.animationRepeatCount = MAXFLOAT;
    [self addSubview:self.imageView];
}

- (void)startAnimation {
    [self.imageView startAnimating];
}

- (void)stopAnimation {
    [self.imageView stopAnimating];
}

- (void)addTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:single];
}


- (void)dealloc {
    self.imageView.animationImages = nil;
}


@end
