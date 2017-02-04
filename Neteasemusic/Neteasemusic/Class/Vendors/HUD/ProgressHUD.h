//
//  ProgressHUD.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/17.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressHUD : UIView

@property (assign, nonatomic) BOOL interaction;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIView *background;
@property (strong, nonatomic) UIToolbar *hud;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel *label;

+ (ProgressHUD *)sharedHUD;
+ (void)hide;
+ (void)show:(NSString *)status;
+ (void)show:(NSString *)status interaction:(BOOL)interaction;
+ (void)showSuccess:(NSString *)status;
+ (void)showSuccess:(NSString *)status interaction:(BOOL)interaction;
+ (void)showError:(NSString *)status;
+ (void)showError:(NSString *)status interaction:(BOOL)interaction;


@end
