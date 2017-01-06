//
//  RecommendViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendViewModel.h"
#import "BaseNetworking.h"
#import "MJExtension.h"

@interface RecommendViewModel ()

@property (copy, nonatomic) Completion completionBlock;

@end


@implementation RecommendViewModel

- (void)refreshDataCompletion:(Completion)complet{
    self.completionBlock = complet;
    BaseNetworking *network = [[BaseNetworking alloc]initWithUrl:@"http://218.200.160.29/rdp2/v5.5/index.do"];
    NSDictionary *parms = @{ @"pageno" : @1 };
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
    
    [RecommendModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"groups" : [GroupModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"banners" : [BannerModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"hotSpots" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"recommends" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"firsts" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"topics" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"radios" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"activities" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"miguColumns" : [RecommendCmModel class]};
    }];
    [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"songs" : [RankSongsModel class]};
    }];
    RecommendModel *recommendMo = [RecommendModel mj_objectWithKeyValues:result];
    self.dataModel = recommendMo;
}

@end
