//
//  RankViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "RankViewController.h"
#import "UserListCell.h"
#import "OfficialListCell.h"
#import "RankViewModel.h"
#import "RankSongsViewController.h"
#define user_spaceW 10


@interface RankViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) RankViewModel *viewModel;

@end

@implementation RankViewController

static NSString *userlistIdentifier = @"userlistIdentifier";
static NSString *officialistIdentifier = @"officialistIdentifier";

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"UserListCell" bundle:nil] forCellWithReuseIdentifier:userlistIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"OfficialListCell" bundle:nil] forCellWithReuseIdentifier:officialistIdentifier];
    @weakify(self)
    [self.viewModel refreshDataCompletion:^(BOOL success) {
        @strongify(self)
        if (success) {
            [self.collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
//UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OfficialListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:officialistIdentifier forIndexPath:indexPath];
        RanksModel *rankModel = self.viewModel.modelArray[indexPath.row];
        cell.ranksModel = rankModel;
        return cell;
    } else {
        UserListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:userlistIdentifier forIndexPath:indexPath];
        return cell;
    }
}

//UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RankSongsViewController *ranksong = [[RankSongsViewController alloc]init];
    ranksong.url = self.viewModel.modelArray[indexPath.row].url;
    [self nv_pushViewController:ranksong animated:YES];
}

//UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(self.view.ymj_w, 123);
    }
    CGFloat itemW = (self.view.ymj_w - 4 * user_spaceW) / 3;
    return CGSizeMake(itemW, itemW + 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    if (section == 0) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsMake(0, user_spaceW, 0, user_spaceW);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.ymj_w, 45);
}

- (RankViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RankViewModel alloc]init];
    }
    return _viewModel;
}

@end
