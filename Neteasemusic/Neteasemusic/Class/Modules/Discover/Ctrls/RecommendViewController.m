//
//  RecommendViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendViewController.h"
#import "RecommendHeaderView.h"
#import "RecommendViewModel.h"

@interface RecommendViewController ()

@property (strong, nonatomic) RecommendViewModel *viewModel;
@property (strong, nonatomic) RecommendHeaderView *headView;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    @weakify(self)
    [self.viewModel refreshDataCompletion:^(BOOL success) {
        @strongify(self)
        if (success) {
            [self reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(RecommendViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RecommendViewModel alloc]init];
    }
    return _viewModel;
}

- (void)setUI {
    CGRect frame = CGRectMake(0, 0, kSCREENkWIDTH, 200);
    self.headView = [[RecommendHeaderView alloc]initWithFrame:frame];
    [self.view addSubview:self.headView];
}

- (void)reloadData {
    self.headView.dataArray = self.viewModel.dataModel.groups[0].banners;
    self.headView.currentIndex = 0;
}

@end
