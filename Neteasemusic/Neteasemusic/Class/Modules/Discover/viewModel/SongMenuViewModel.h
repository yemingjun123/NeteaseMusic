//
//  SongMenuViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "SongMenuModel.h"
#import "SongMenuCell.h"
#import "RecommendTagView.h"

static NSString * const cellIdentifier = @"SongMenuIdentifier";
static NSString * const tagIdentifier = @"SongMenuTagIdentifier";

@interface SongMenuViewModel : BaseViewModel

@property (strong, nonatomic) NSArray <SongMenuList *>* dataArray;

- (CGSize)sizeForRowInCount:(NSInteger)count;
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
