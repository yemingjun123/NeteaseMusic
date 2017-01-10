//
//  RecommendViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendViewModel.h"
#import "MJExtension.h"
#define SPACE  10
#define SIZE_HEIGTH 145
@class RecommendBannerView,RecommendTagView;

@implementation RecommendViewModel
@synthesize responseObject = _responseObject;

- (void)refreshDataCompletion:(Completion)complet{
    NSString *url = @"http://218.200.160.29/rdp2/v5.5/index.do";
    NSDictionary *pramas = @{ @"pageno" : @1 };
    [self refreshDataUrl:url pramas:pramas completion:complet];
}

- (void)setResponseObject:(id)responseObject {
    _responseObject = responseObject;
    [RecommendModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"groups" : [RecommendGroupModel class]};
    }];
    [RecommendGroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"banners" : [BannerModel class],
                 @"hotSpots" : [RecommendCmModel class],
                 @"recommends" : [RecommendCmModel class],
                 @"songs" : [RankSongsModel class],
                 @"firsts" : [RecommendCmModel class],
                 @"topics" : [RecommendCmModel class],
                 @"radios" : [RecommendCmModel class],
                 @"activities" : [RecommendCmModel class],
                 @"miguColumns" : [RecommendCmModel class]
                 };
    }];
    self.dataModel = [RecommendModel mj_objectWithKeyValues:_responseObject];
    self.dataArray = self.dataModel.groups;

}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    NSInteger number = 0;
    NSArray *array = [self dataArrayOfItemsInSection:section];
    if (array) {
        number = array.count;
    }
    return number;
}

- (NSArray *)dataArrayOfItemsInSection:(NSInteger)section {
    NSArray *array = nil;
    if (section < self.dataArray.count) {
        RecommendGroupModel *model = [self.dataArray objectAtIndex:section];
        switch (section) {
            case 0:
                break;
            case 1:
                array = model.hotSpots;
                break;
            case 2:
                array = model.recommends;
                break;
            case 3:
                array = model.songs;
                break;
            case 4:
                array = model.firsts;
                break;
            case 5:
                array = model.topics;
                break;
            case 6:
                array = model.radios;
                break;
            case 7:
                array = model.activities;
                break;
            case 9:
                array = model.miguColumns;
                break;
        }
    }
    return array;
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    NSInteger number = [self numberOfItemsInSection:indexPath.section];
    if (number == 2 || number == 4 || number == 3) {
        CGFloat w = (kSCREENkWIDTH - 3 * SPACE ) / 2;
        size = CGSizeMake(w, SIZE_HEIGTH);
    }
    if (number >= 5) {
        CGFloat w = (kSCREENkWIDTH - 4 * SPACE ) / 3;
        size = CGSizeMake(w, SIZE_HEIGTH);
    }
    if ((number == 3 && indexPath.row == 2) || number == 1) {
        CGFloat w = kSCREENkWIDTH - 2 * SPACE;
        size = CGSizeMake(w, SIZE_HEIGTH);
    }
    return size;
}

- (CGSize)referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize size = CGSizeZero;
    if (section == 0 ) {
        size = CGSizeMake(kSCREENkWIDTH, 200);
    } else if([self numberOfItemsInSection:section]) {
        size = CGSizeMake(kSCREENkWIDTH, 45);
    }
    return size;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RecommendBannerView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:bannerIdentifier forIndexPath:indexPath];
        headerView.dataArray = [self.dataArray objectAtIndex:0].banners;
        return headerView;
    }
    RecommendTagView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:tagIdentifier forIndexPath:indexPath];
    RecommendGroupModel *model = [self.dataArray objectAtIndex:indexPath.section];
    headerView.title = model.title;
    return headerView;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSArray *array = [self dataArrayOfItemsInSection:indexPath.section];
    if (indexPath.section == 3) {
        cell.songModel = array[indexPath.row];
    } else {
        cell.topModel = array[indexPath.row];
    }
    return cell;
}

@end
