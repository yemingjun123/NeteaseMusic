//
//  RankSongsViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/5.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankSongsViewController.h"
#import "RankViewModel.h"

@interface RankSongsViewController ()

@property (strong, nonatomic) RankSongsViewModel *viewModel;

@end

@implementation RankSongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self)
    [self.viewModel refreshDataUrl:self.url pramas:@{@"pageno": @1} completion:^(BOOL success) {
        @strongify(self)
        if (success) {
//            [self loadView];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (RankSongsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RankSongsViewModel alloc]init];
    }
    return _viewModel;
}


@end
