//
//  RankSongsViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/5.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankSongsViewController.h"
#import "RankModel.h"
#import "RankViewModel.h"
#import "RankSongHeaderView.h"
#import "RankSongsCell.h"
#import "UIImageView+AFNetworking.h"

@interface RankSongsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) RankSongsViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *cellIdentifier = @"RankSongsCellIdentifier";

@implementation RankSongsViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    RankSongHeaderView *headerView = [[RankSongHeaderView alloc]initWithFrame:CGRectMake(0, 0, kSCREENkWIDTH, 270)];
    self.tableView.tableHeaderView = headerView;
    [self.tableView registerNib:[UINib nibWithNibName:@"RankSongsCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    @weakify(self)
    [self.viewModel refreshDataUrl:self.url pramas:@{@"pageno": @1} completion:^(BOOL success) {
        @strongify(self)
        if (success) {
            [self setupRankSongsHeaderView:headerView];
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - setupData 
- (void)setupRankSongsHeaderView:(RankSongHeaderView *)headView {
    NSURL *url = [NSURL URLWithString:self.viewModel.data.img];
    [headView.imageView setImageWithURL:url];
    NSString *time = [NSString stringWithFormat:@"最近更新：%@",self.viewModel.data.publishTime];
    headView.timeLabel.text = time;
    [self setMiddleLabelTitle:self.viewModel.data.shareTitle color:UIColorFromRGB(whiteColor)];
}

- (RankSongsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RankSongsViewModel alloc]init];
    }
    return _viewModel;
}

#pragma mark - delegate
//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankSongsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    RankSongsModel *model = self.viewModel.modelArray[indexPath.row];
    model.number = indexPath.row;
    cell.model = model;
    return cell;
}

//UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self nv_changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
}

@end
