//
//  FriendViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "FriendViewController.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMiddleSegmentedItems:@[@"关注",@"附近"] target:self action:@selector(touchSegmentedControlEvent:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchSegmentedControlEvent:(UISegmentedControl *)segment {
    switch (segment.selectedSegmentIndex) {
        case 0:
            NSLog(@"点击了关注");
            break;
        case 1:
            NSLog(@"点击了附近");
            break;
        default:
            break;
    }
}

@end
