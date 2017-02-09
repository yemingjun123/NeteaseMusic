//
//  NTTableViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "NTTableViewController.h"

@interface NTTableViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation NTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:_tableView = tableView];
    }
    return _tableView;
}

- (void)beginFooterRefashComplet:(RefreshComponentBlock)block {
    self.tableView.nt_footer = [RefreshAutoStateFooter footerWithRefreshingBlock:block];
}

- (void)beginHeaderRefrashComplet:(RefreshComponentBlock)block {
    self.tableView.nt_header = [LoadingGIFHeader headerWithRefreshingBlock:block];
}

- (void)endRefrash {
    if (self.tableView.nt_header) [self.tableView.nt_header endRefreshing];
    if (self.tableView.nt_footer) [self.tableView.nt_footer endRefreshing];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
