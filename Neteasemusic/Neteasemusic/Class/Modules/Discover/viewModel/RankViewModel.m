//
//  RankViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankViewModel.h"
#import "BaseNetworking.h"

@interface RankViewModel ()

@property (copy, nonatomic) Completion completionBlock;

@end

@implementation RankViewModel

- (void)refreshDataCompletion:(Completion)complet{
    self.completionBlock = complet;
    BaseNetworking *network = [[BaseNetworking alloc]initWithUrl:@"http://a.mll.migu.cn/rdp2/v5.5/ranklist.do"];
    NSDictionary *parms = @{
                            @"groupcode" : @"rank",
                            @"ua"        : @"Iphone_Sst",
                            @"version"   : @"4.30903",
                            @"pageno"    : @1
                            };
    @weakify(self)
    [network requestWithMethod:@"GET" params:parms completion:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseObject) {
            @strongify(self)
            if (responseObject) {
                [self startParsingData:responseObject];
                self.completionBlock(YES);
            }
            if (error) {
                self.completionBlock(NO);
            }
        }
    }];
}

- (void)startParsingData:(id)result {
    NSArray *groups = [result objectForKey:@"groups"];
    GroupsModel *groupModel = [GroupsModel mj_objectWithKeyValues:groups[0]];
    self.modelArray = groupModel.ranks;
}




@end
