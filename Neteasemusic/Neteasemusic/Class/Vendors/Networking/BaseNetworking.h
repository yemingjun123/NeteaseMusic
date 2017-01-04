//
//  BaseNetworking.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HTTPRequestCompletion)(NSURLResponse *response, id responseObject, NSError *error);

@interface BaseNetworking : NSObject

- (instancetype)initWithUrl:(NSString *)urlString;

- (void)requestWithMethod:(NSString *)methodType
                   params:(id)params
               completion:(HTTPRequestCompletion)completion;

- (void)cancelAllRequest;

- (void)cancelRequest:(NSUInteger)index;

@end

