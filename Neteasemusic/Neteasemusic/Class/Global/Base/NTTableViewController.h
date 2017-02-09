//
//  NTTableViewController.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "BaseViewController.h"
#import "Refresh.h"

@interface NTTableViewController : BaseViewController

@property (weak, nonatomic) UITableView *tableView;

- (void)beginHeaderRefrashComplet:(RefreshComponentBlock)block;
- (void)beginFooterRefashComplet:(RefreshComponentBlock)block;
- (void)endRefrash;

@end
