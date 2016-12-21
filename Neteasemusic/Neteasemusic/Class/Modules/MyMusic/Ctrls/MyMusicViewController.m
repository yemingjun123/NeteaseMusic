//
//  MyMusicViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "MyMusicViewController.h"
#import "MySingerViewController.h"
#import "PlayListViewController.h"

@interface MyMusicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)MySingerViewController *singerController;
@property (strong, nonatomic)PlayListViewController *playlistController;

@end

@implementation MyMusicViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMiddleLabelTitle:@"我的音乐" color:UIColorFromRGB(whiteColor)];
    [self setLeftBarButton:nil title:@"更多" target:self action:@selector(touchMoreEvent)];
    [self.tableView setTableHeaderView:self.tableHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate 
// UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - Response Event
- (void)touchMoreEvent {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}

- (IBAction)touchDownloadMusicEvent:(id)sender {
}

- (IBAction)touchPlayListEvent:(id)sender {
    [self.navigationController pushViewController:newClass(@"PlayListViewController") animated:YES];
}

- (IBAction)touchMySingerEvent:(id)sender {
    [self.navigationController pushViewController:newClass(@"MySingerViewController") animated:YES];
}

@end
