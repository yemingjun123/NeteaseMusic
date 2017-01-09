//
//  RankViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankViewModel.h"
#import "MJExtension.h"

@implementation RankViewModel
@synthesize responseObject = _responseObject;

- (void)refreshDataCompletion:(Completion)complet{
    NSDictionary *parms = @{
                            @"groupcode" : @"rank",
                            @"pageno"    : @1
                            };
    NSString *url = @"http://a.mll.migu.cn/rdp2/v5.5/ranklist.do";
    [self refreshDataUrl:url pramas:parms completion:complet];
}

- (void)setResponseObject:(id)responseObject {
    _responseObject = responseObject;
    [RankModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"groups" : [GroupsModel class]};
    }];
    [GroupsModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"ranks" : [RanksModel class]};
    }];
    [RanksModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"rankSongs" : [RankSongsModel class]};
    }];
    RankModel *rankModel = [RankModel mj_objectWithKeyValues:_responseObject];
    self.groupArray = rankModel.groups;
    self.modelArray = [self.groupArray lastObject].ranks;
}

@end

@implementation RankSongsViewModel
@synthesize responseObject = _responseObject;

- (void)setResponseObject:(id)responseObject {
    _responseObject = responseObject;
    [RanksModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"rankSongs" : [RankSongsModel class]};
    }];
    [RanksModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"rankSongs" : @"songs"};
    }];
    self.data = [RanksModel mj_objectWithKeyValues:_responseObject];
    self.modelArray = self.data.rankSongs;
}

@end


