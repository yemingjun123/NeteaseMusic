//
//  BaseNavigationController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@property (getter=isPushing, nonatomic) BOOL pushing;

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.pushing == YES) {
        return;
    } else {
        self.pushing = YES;
    }
    [super pushViewController:viewController animated:animated];
}


#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.pushing = NO;
}


@end
