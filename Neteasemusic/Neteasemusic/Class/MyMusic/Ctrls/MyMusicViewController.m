//
//  MyMusicViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "MyMusicViewController.h"

@interface MyMusicViewController ()

@end

@implementation MyMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMiddleLabelTitle:@"我的音乐" color:UIColorFromRGB(0xffffff)];
    [self setLeftButton:nil title:@"更多" target:self action:@selector(touchMoreEvent)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Event bill
- (void)touchMoreEvent {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}



@end
