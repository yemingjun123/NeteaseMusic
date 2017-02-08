//
//  RecommendViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendViewController.h"
#import "RecommendViewModel.h"
#import "Refresh.h"

@interface RecommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) RecommendViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RecommendViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    @weakify(self)
    [self.viewModel refreshDataCompletion:^(BOOL success) {
        @strongify(self)
        if (success) {
            [self.collectionView reloadData];
        }
    }];
    
    self.collectionView.nt_header = [LoadingGIFHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.nt_header endRefreshing];
        });
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
    [self.collectionView registerNib:[UINib nibWithNibName:@"RecommendCell" bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView registerClass:[RecommendTagView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:tagIdentifier];
    [self.collectionView registerClass:[RecommendBannerView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:bannerIdentifier];
}

#pragma mark - delegate
//UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.viewModel.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewModel numberOfItemsInSection:section];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

//UICollectionViewDelegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return [self.viewModel collectionView:collectionView atIndexPath:indexPath];
}

//UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel sizeForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return [self.viewModel referenceSizeForHeaderInSection:section];
}


@end
