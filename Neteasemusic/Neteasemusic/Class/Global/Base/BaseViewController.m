//
//  BaseViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseViewController.h"
#import "TopBarPlayButton.h"
#import "MusicPlayerViewController.h"

@interface BaseViewController ()

@property (strong, nonatomic) TopBarPlayButton *reightBarItem;
@property (strong, nonatomic) MusicPlayerViewController *musicPlayer;

@end

@implementation BaseViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.musicPlayer = [[MusicPlayerViewController alloc]init];
    self.navigationController.navigationBar.translucent = NO;
    [self setColor:UIColorFromRGB(darkRedColor)];
    [self setLeftBarButton:[UIImage imageNamed:@"cm2_topbar_icn_back.png"]
        title:nil target:self action:@selector(touchBackEvent)];
    self.reightBarItem = [TopBarPlayButton sharedTopBarPlayButton];
    [self.reightBarItem addTarget:self action:@selector(touchPlayPageEvent)];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:self.reightBarItem];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if (self.navigationController.viewControllers.count > 1) {
//        self.tabBarController.tabBar.hidden = YES;
//        self.hidesBottomBarWhenPushed
//    } else {
//        self.tabBarController.tabBar.hidden = NO;
//    }
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

- (void)setMiddleSegmentedItems:(NSArray *)items target:(id)target action:(SEL)action {
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:items];
    segment.selectedSegmentIndex = 0;
    segment.frame = CGRectMake(0, 0, 140, 30);
    segment.tintColor = UIColorFromRGB(whiteColor);
    [segment addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segment;
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
    [self nv_pushViewController:self.musicPlayer animated:YES];
}

- (void)nv_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
