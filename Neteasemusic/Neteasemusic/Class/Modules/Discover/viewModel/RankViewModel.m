//
//  RankViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankViewModel.h"
#import "BaseNetworking.h"
#import "MJExtension.h"

@interface RankViewModel ()

@property (copy, nonatomic) Completion completionBlock;

@end

@interface RankSongsViewModel ()

@property (copy, nonatomic) Completion completionBlock;

@end

@implementation RankViewModel

- (void)refreshDataCompletion:(Completion)complet{
    self.completionBlock = complet;
    BaseNetworking *network = [[BaseNetworking alloc]initWithUrl:@"http://a.mll.migu.cn/rdp2/v5.5/ranklist.do"];
    NSDictionary *parms = @{
                            @"groupcode" : @"rank",
                            @"pageno"    : @1
                            };
    @weakify(self)
    [network requestWithMethod:@"GET" params:parms completion:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseObject) {
            @strongify(self)
            if (responseObject) {
                [self modelArrayWithKeyValues:responseObject];
                self.completionBlock(YES);
            }
            if (error) {
                self.completionBlock(NO);
            }
        }
    }];
}

- (void)modelArrayWithKeyValues:(id)result {
    [RankModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"groups" : [GroupsModel class]};
    }];
    [GroupsModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"ranks" : [RanksModel class]};
    }];
    [RanksModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"rankSongs" : [RankSongsModel class]};
    }];
    RankModel *rankModel = [RankModel mj_objectWithKeyValues:result];
    self.groupArray = rankModel.groups;
    self.modelArray = [self.groupArray lastObject].ranks;
}

@end

@implementation RankSongsViewModel

- (void)refreshDataUrl:(NSString *)url pramas:(id)pramas completion:(Completion)complet {
    self.completionBlock = complet;
    BaseNetworking *network = [[BaseNetworking alloc]initWithUrl:url];
    @weakify(self)
    [network requestWithMethod:@"GET" params:pramas completion:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseObject) {
            @strongify(self)
            if (responseObject) {
                [self modelArrayWithKeyValues:responseObject];
                self.completionBlock(YES);
            }
            if (error) {
                self.completionBlock(NO);
            }
        }
    }];
}

- (void)modelArrayWithKeyValues:(id)result {
    [RanksModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"rankSongs" : [RankSongsModel class]};
    }];
    [RanksModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"rankSongs" : @"songs"};
    }];
    self.data = [RanksModel mj_objectWithKeyValues:result];
    self.modelArray = self.data.rankSongs;
}


@end


