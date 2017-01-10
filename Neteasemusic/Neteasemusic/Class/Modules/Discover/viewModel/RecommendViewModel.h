//
//  RecommendViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecommendModel.h"
#import "BaseViewModel.h"
#import "RecommendBannerView.h"
#import "RecommendTagView.h"
#import "RecommendCell.h"

static NSString * const tagIdentifier = @"RecommendTagIdentifier";
static NSString * const bannerIdentifier = @"RecommendBannerIdentifier";
static NSString * const cellIdentifier = @"RecommendCellIdentifier";

@interface RecommendViewModel : BaseViewModel

@property (strong, nonatomic) RecommendModel *dataModel;
@property (strong, nonatomic) NSArray <RecommendGroupModel *> *dataArray;

- (void)refreshDataCompletion:(Completion)complet;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section;
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
