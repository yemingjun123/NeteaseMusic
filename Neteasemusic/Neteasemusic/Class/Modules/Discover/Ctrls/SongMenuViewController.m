//
//  SongMenuViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "SongMenuViewController.h"
#import "SongMenuViewModel.h"

@interface SongMenuViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic)        SongMenuViewModel *viewModel;
@property (assign, nonatomic)        NSInteger pageNo;

@end

@implementation SongMenuViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    _pageNo = 1;
    NSString *url = @"http://218.200.160.29/rdp2/v5.5/musicLists.do";
    NSDictionary *pramas = @{
                            @"groupcode" : @"365925",
                            @"sort" : @"1",
                            @"pageno" : @(_pageNo)
                            };
    @weakify(self)
    [self.viewModel refreshDataUrl:url pramas:pramas completion:^(BOOL success) {
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

#pragma mark - getter
- (SongMenuViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SongMenuViewModel alloc]init];
    }
    return _viewModel;
}

- (void)setupUI {
    [self.collectionView registerNib:[UINib nibWithNibName:@"SongMenuCell" bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView registerClass:[RecommendTagView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:tagIdentifier];
}

#pragma mark - delegate
//UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
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
    return [self.viewModel sizeForRowInCount:2];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.collectionView.ymj_w, 45);
}


@end
