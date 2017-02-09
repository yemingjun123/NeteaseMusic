//
//  NTBaseViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "NTCollectionViewController.h"

@interface NTCollectionViewController ()

@end

@implementation NTCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = UIColorFromRGB(0xffffff);
        [self.view addSubview:_collectionView = collectionView];
    }
    return _collectionView;
}

- (void)beginFooterRefashComplet:(RefreshComponentBlock)block {
    self.collectionView.nt_footer = [RefreshAutoStateFooter footerWithRefreshingBlock:block];
}

- (void)beginHeaderRefrashComplet:(RefreshComponentBlock)block {
    self.collectionView.nt_header = [LoadingGIFHeader headerWithRefreshingBlock:block];
    [self.collectionView.nt_header beginRefreshing];
}

- (void)endRefrash {
    if (self.collectionView.nt_header) [self.collectionView.nt_header endRefreshing];
    if (self.collectionView.nt_footer) [self.collectionView.nt_footer endRefreshing];
}


@end
