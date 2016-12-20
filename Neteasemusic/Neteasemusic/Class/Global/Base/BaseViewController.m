//
//  BaseViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseViewController.h"
#import "TapBarPlayButton.h"


@interface BaseViewController ()

@property (strong, nonatomic) TapBarPlayButton *reightBarItem;

@end

@implementation BaseViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(darkRedColor);
    [self setLeftBarButton:[UIImage imageNamed:@"cm2_topbar_icn_back.png"]
        title:nil target:self action:@selector(touchBackEvent)];
    if (!self.reightBarItem) {
        self.reightBarItem = [[TapBarPlayButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)
            target:self action:@selector(touchPlayPageEvent)];
        UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:self.reightBarItem];
        self.navigationItem.rightBarButtonItem = rightBar;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - customNavigationBar
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

- (void)setLeftBarButton:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action{
    UIButton *button = customBarButtonItem(image, title, target, action);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftBar;
}

- (void)setRightBarButton:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = customBarButtonItem(image, title, target, action);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBar;
}

#pragma mark - Response Event
- (void)touchBackEvent {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchPlayPageEvent {
    [self.reightBarItem startAnimation];
}

@end
