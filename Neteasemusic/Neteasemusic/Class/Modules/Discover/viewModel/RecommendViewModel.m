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
    /*
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*hotSpots;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*recommends;
     //@property (strong, nonatomic) NSArray <RankSongsModel *>*songs;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*firsts;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*topics;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*radios;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*activities;
     //@property (strong, nonatomic) NSArray <RecommendCmModel *>*miguColumns;
     */
    [RecommendGroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"banners" : [BannerModel class],
//                 @"items"   : [RecommendCmModel class]
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
//    [RecommendGroupModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"items" : @"hotSpots",
//                 @"items" : @"recommends",
//                 @"items" : @"firsts",
//                 @"items" : @"topics",
//                 @"items" : @"radios",
//                 @"items" : @"activities",
//                 @"items" : @"miguColumns",
//                 @"items" : @"songs"
//                 };
//    }];
    self.dataModel = [RecommendModel mj_objectWithKeyValues:_responseObject];
    self.dataArray = self.dataModel.groups;

}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    NSInteger number = 0;
    if (section < self.dataArray.count) {
        RecommendGroupModel *model = [self.dataArray objectAtIndex:section];
        switch (section) {
            case 0:
                number = 0;
                break;
            case 1:
                number = model.hotSpots.count;
                break;
            case 2:
                number = model.recommends.count;
                break;
            case 3:
                number = model.songs.count;
                break;
            case 4:
                number = model.firsts.count;
                break;
            case 5:
                number = model.topics.count;
                break;
            case 6:
                number = model.radios.count;
                break;
            case 7:
                number = model.activities.count;
                break;
            case 9:
                number = model.miguColumns.count;
                break;
        }
    }
    return 0;
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeZero;
    NSInteger number = [self numberOfItemsInSection:indexPath.section];
    if (number == 2 && number == 4) {
        CGFloat w = (kSCREENkWIDTH - 3 * SPACE ) / 2;
        size = CGSizeMake(w, SIZE_HEIGTH);
    } else if (number >= 5) {
        CGFloat w = (kSCREENkWIDTH - 4 * SPACE ) / 3;
        size = CGSizeMake(w, SIZE_HEIGTH);
    } else if ((number == 3 && indexPath.row == 2) || number == 1) {
        CGFloat w = kSCREENkWIDTH - 2 * SPACE;
        size = CGSizeMake(w, SIZE_HEIGTH);
    }
    return size;
}


@end
