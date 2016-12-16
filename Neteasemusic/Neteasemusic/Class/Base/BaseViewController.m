//
//  BaseViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0xd43b33);
//    [UIApplication sharedApplication] setStatusBarStyle:<#(UIStatusBarStyle)#> animated:<#(BOOL)#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setColor:(UIColor *)color {
    self.navigationController.navigationBar.barTintColor = color;
}

- (void)setMiddleLabelTitle:(NSString *)title color:(UIColor *)color{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = color;
    self.navigationItem.titleView = titleLabel;
    [titleLabel sizeToFit];
}

- (void)setLeftButton:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    if (image) {
        UIImage *backgroundImage = [image copy];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0 , 0, 28)];
        [button setImage:backgroundImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 40, 40);
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 70, 44);
        [button setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = rightBar;
}

- (void)setRightButton:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    if (image) {
        UIImage *backgroundImage = [image copy];
        [button setImage:backgroundImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 45, 45);
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.frame = CGRectMake(0, 0, 70 , 44);
        [button setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBar;
}


@end
