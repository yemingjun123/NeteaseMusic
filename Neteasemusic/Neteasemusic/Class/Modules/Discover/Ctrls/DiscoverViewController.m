//
//  DiscoverViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "DiscoverViewController.h"
#import "RankViewController.h"
#import "RecommendViewController.h"
#import "SongMenuViewController.h"

@interface DiscoverViewController ()<SlidingViewDelegate,SlidingViewDataSource>

@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *controllers;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.dataSource = self;
    self.titles = @[@"个性推荐",@"歌单",@"主播电台",@"排行榜"];
    RecommendViewController *v1 = [[RecommendViewController alloc]init];
    SongMenuViewController *v2 = [[SongMenuViewController alloc]init];
    UIViewController *v3 = [[UIViewController alloc]init];
    v3.view.backgroundColor = UIColorFromRGB(whiteColor);
    RankViewController *v4 = [[RankViewController alloc]init];
    self.controllers = @[v1,v2,v3,v4];    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
// SlidingViewDataSource
- (NSInteger)numberOfPageInSlidingController:(SlidingViewController *)controller {
    return self.titles.count;
}

- (UIViewController *)slidingController:(SlidingViewController *)slidingController controllerAtIndex:(NSInteger)index {
    return self.controllers[index];
}

- (NSString *)slidingController:(SlidingViewController *)slidingController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}


@end
