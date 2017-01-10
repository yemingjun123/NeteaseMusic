//
//  SongMenuViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "SongMenuViewModel.h"
#import "MJExtension.h"

@implementation SongMenuViewModel
@synthesize responseObject = _responseObject;

//- (void)refreshDataCompletion:(Completion)complet{
//    NSString *url = @"http://218.200.160.29/rdp2/v5.5/index.do";
//    NSDictionary *pramas = @{ @"pageno" : @1 };
//    [self refreshDataUrl:url pramas:pramas completion:complet];
//}

- (void)setResponseObject:(id)responseObject {
    _responseObject = responseObject;
    [SongMenuModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"list" : [SongMenuList class]};
    }];
    [SongMenuList mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"owner" : [Owner class]};
    }];
    SongMenuModel *model = [SongMenuModel mj_objectWithKeyValues:_responseObject];
    self.dataArray = model.list;
}

- (CGSize)sizeForRowInCount:(NSInteger)count {
    CGFloat w = (kSCREENkWIDTH - (count + 1) * 10) / count;
    return CGSizeMake(w, w * 1.25);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    RecommendTagView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:tagIdentifier forIndexPath:indexPath];
    headerView.title = @"全部歌单";
    return headerView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SongMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}


@end
