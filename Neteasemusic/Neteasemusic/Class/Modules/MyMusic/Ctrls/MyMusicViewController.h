//
//  MyMusicViewController.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MyMusicTableHeaderView.h"

@interface MyMusicViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MyMusicTableHeaderView *tableHeaderView;

- (IBAction)touchDownloadMusicEvent:(id)sender;
- (IBAction)touchPlayListEvent:(id)sender;
- (IBAction)touchMySingerEvent:(id)sender;

@end
