//
//  PlayMusicViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "MusicPlayerViewController.h"
#import "UIImageView+YMJBlurEffects.h"

@interface MusicPlayerViewController ()


@end

@implementation MusicPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


- (IBAction)touchPlayEvent:(UIButton *)sender {
}

- (IBAction)touchNextEvent:(UIButton *)sender {
}

- (IBAction)touchPrevEvent:(UIButton *)sender {
}

- (IBAction)touchPlayModeEvent:(UIButton *)sender {
}

- (IBAction)touchPlayListEvent:(UIButton *)sender {
}

- (IBAction)touchBackEvent:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchShareEvent:(UIButton *)sender {
}

@end
