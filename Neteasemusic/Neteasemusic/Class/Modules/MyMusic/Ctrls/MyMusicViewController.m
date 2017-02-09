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

#import "Refresh.h"

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
    
    self.tableView.nt_header = [RefreshStateHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.nt_header endRefreshing];
        });
    }];
    
    self.tableView.nt_footer = [RefreshAutoStateFooter footerWithRefreshingBlock:^{
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.nt_footer endRefreshing];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate 
// UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hehehe"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hehehe"];
    }
    cell.textLabel.text = @"ssasdasdasd";
    return cell;
}

#pragma mark - Response Event
- (void)touchMoreEvent {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}

- (IBAction)touchDownloadMusicEvent:(id)sender {
}

- (IBAction)touchPlayListEvent:(id)sender {
    PlayListViewController *play = [[PlayListViewController alloc]init];
    [self nv_pushViewController:play animated:YES];
}

- (IBAction)touchMySingerEvent:(id)sender {
    MyMusicViewController *myMusic = [[MyMusicViewController alloc]init];
    [self nv_pushViewController:myMusic animated:YES];
}

@end
