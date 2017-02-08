//
//  ProgressHUD.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/17.
//  Copyright © 2017年 叶明君. All rights reserved.
//

/*
 1. 初始化HUD对象；
 2. 创建HUD UI(注意避免重复添加)；
 3. 计算控件frame；
 4. 显示；
 5. 隐藏 && 销毁；
 */

#import "ProgressHUD.h"

#define HUD_Success_IMG [UIImage imageNamed:@"ProgressHUD.bundle/progresshud-success.png"]
#define HUD_Error_IMG   [UIImage imageNamed:@"ProgressHUD.bundle/progresshud-success.png"]
#define HUD_Font        [UIFont systemFontOfSize:16];

@implementation ProgressHUD
@synthesize interaction, window, background, hud, spinner, image, label;

#pragma mark - 构造
+ (ProgressHUD *)sharedHUD {
    static dispatch_once_t once = 0;
    static ProgressHUD *instance;
    dispatch_once(&once, ^{ instance = [[ProgressHUD alloc] init]; });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
        if ([delegate respondsToSelector:@selector(window)]) {
            window = [delegate performSelector:@selector(window)];
        } else {
            window = [[UIApplication sharedApplication] keyWindow];
        }
        background = nil; hud = nil; spinner = nil; image = nil; label = nil;
        self.alpha = 0;
    }
    return self;
}

#pragma mark - public
+ (void)hide {
    [[self sharedHUD] hudHide];
}

+ (void)show:(NSString *)status {
    [[self sharedHUD] hudShow:status image:nil spin:YES hide:NO];
}

+ (void)show:(NSString *)status interaction:(BOOL)interaction {
    [self sharedHUD].interaction = interaction;
    [[self sharedHUD] hudShow:status image:nil spin:YES hide:NO];
}

+ (void)showSuccess:(NSString *)status {
    [[self sharedHUD] hudShow:status image:HUD_Success_IMG spin:NO hide:YES];
}

+ (void)showSuccess:(NSString *)status interaction:(BOOL)interaction {
    [self sharedHUD].interaction = interaction;
    [[self sharedHUD] hudShow:status image:HUD_Success_IMG spin:NO hide:YES];
}

+ (void)showError:(NSString *)status {
    [[self sharedHUD] hudShow:status image:HUD_Error_IMG spin:NO hide:YES];
}

+ (void)showError:(NSString *)status interaction:(BOOL)interaction {
    [self sharedHUD].interaction = interaction;
    [[self sharedHUD] hudShow:status image:HUD_Error_IMG spin:NO hide:YES];
}

#pragma mark - private
- (void)hudShow:(NSString *)title image:(UIImage *)img spin:(BOOL)spin hide:(BOOL)hide {
    [self createHUD];
    label.text = title;
    label.hidden = (title == nil) ? YES : NO;
    image.image = img;
    image.hidden = (img == nil) ? YES : NO;
    [self hudSize];
    [self hudShow];
    if (spin) [spinner startAnimating]; else [spinner stopAnimating];
    if (hide) [NSThread detachNewThreadSelector:@selector(timedHideHUD) toTarget:self withObject:nil];
}

- (void)createHUD {
    if (hud == nil) {
        hud = [[UIToolbar alloc] init];
        hud.frame = CGRectZero;
        hud.translucent = NO;
        hud.layer.cornerRadius = 10;
        hud.layer.masksToBounds = YES;
    }
    if (hud.superview == nil) {
        if (interaction == NO) {
            background = [[UIView alloc] initWithFrame:window.frame];
            [window addSubview:background];
            [background addSubview:hud];
        } else {
            [window addSubview:self.hud];
        }
    }
    if (spinner == nil) {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.hidesWhenStopped =YES;
    }
    if (spinner.superview == nil) [hud addSubview:spinner];
    if (image == nil) {
        image = [[UIImageView alloc] init];
    }
    if (image.superview == nil) [hud addSubview:image];
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.frame = CGRectZero;
        label.font = HUD_Font;
        label.textColor = UIColorFromRGB(0x333333);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        label.numberOfLines = 0;
    }
    if (label.superview == nil) [hud addSubview:label];
}

- (void)hudSize {
    CGRect labelRect = CGRectZero;
    CGFloat hudWidth = 100, hudHeight = 100;
    if (label.text != nil) {
        labelRect = [label.text ymj_boundingRectWithFont:label.font width:200];
        labelRect.origin.x = 12;
        labelRect.origin.y = 66;
        hudWidth = labelRect.size.width + 24;
        hudHeight = labelRect.size.height + 80;
        if (hudWidth < 100) {
            hudWidth = 100;
            labelRect.origin.x = 0;
            labelRect.size.width = 100;
        }
    }
    hud.bounds = CGRectMake(0, 0, hudWidth, hudHeight);
    CGFloat imageX = hudWidth / 2;
    CGFloat imageY = (label.text == nil) ? hudHeight/2 : 36;
    image.center = spinner.center = CGPointMake(imageX, imageY);
    label.frame = labelRect;
}

- (void)hudShow {
    if (self.alpha == 0) {
        self.alpha = 1;
        hud.alpha = 0;
        hud.transform = CGAffineTransformScale(hud.transform, 1.4, 1.4);
        NSUInteger option = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut;
        [UIView animateWithDuration:0.2f delay:0.0f options:option animations:^{
            hud.transform = CGAffineTransformScale(hud.transform, 1 / 1.4, 1 / 1.4);
            hud.alpha = 1;
        } completion:nil];
    }
}

- (void)hudHide {
    if (self.alpha == 1) {
        NSUInteger option = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseIn;
        [UIView animateWithDuration:0.2f delay:0.0f options:option animations:^{
            hud.transform = CGAffineTransformScale(hud.transform, 0.7, 0.7);
            hud.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self hudRemove];
            self.alpha = 0.0f;
        }];
    }
}

- (void)hudRemove {
    [label removeFromSuperview];        label = nil;
    [image removeFromSuperview];        image = nil;
    [spinner removeFromSuperview];      spinner = nil;
    [hud removeFromSuperview];          hud = nil;
    [background removeFromSuperview];   background = nil;
}

- (void)timedHideHUD {
    @autoreleasepool {
        NSTimeInterval sleep = label.text.length * 0.04 + 2;
        [NSThread sleepForTimeInterval:sleep];
        kDispatch_main(^{
            [self hudHide];
        });
    }
}

@end
