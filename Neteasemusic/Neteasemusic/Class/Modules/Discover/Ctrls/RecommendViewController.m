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

@interface RecommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) RecommendViewModel *viewModel;
@property (strong, nonatomic) RecommendHeaderView *headView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RecommendViewController

#pragma mark - lifecycle
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
    self.headView = [[RecommendHeaderView alloc]initWithFrame:frame style:RecommendHeaderTag];
    [self.view addSubview:self.headView];

}

- (void)reloadData {
    self.headView.title = @"哈哈哈哈哈哈";
    [self.collectionView reloadData];
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
//    return [self newCellAtIndexPath:indexPath];
    return nil;
}

- (void)newCellAtIndexPath:(NSIndexPath *)indexPath {
    
}

//UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel sizeForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.ymj_w, 45);
}


@end
