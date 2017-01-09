//
//  BaseViewModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "BaseViewModel.h"
#import "BaseNetworking.h"

@implementation BaseViewModel

- (void)refreshDataUrl:(NSString *)url pramas:(NSDictionary *)pramas completion:(Completion)complet {
    self.completionBlock = complet;
    BaseNetworking *network = [[BaseNetworking alloc]initWithUrl:url];
    @weakify(self)
    [network requestWithMethod:@"GET" params:pramas completion:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseObject) {
            @strongify(self)
            if (responseObject) {
                self.responseObject = responseObject;
                self.completionBlock(YES);
            }
            if (error) {
                self.completionBlock(NO);
            }
        }
    }];
}

@end
