//
//  BaseNetworking.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "BaseNetworking.h"
#import "AFNetworking.h"

@interface BaseNetworking ()

@property (strong, nonatomic) AFURLSessionManager *manager;
@property (copy, nonatomic) HTTPRequestCompletion completionBlock;
@property (strong, nonatomic) NSMutableURLRequest *request;
@property (copy, nonatomic) NSString *urlString;

@end

@implementation BaseNetworking

- (instancetype)initWithUrl:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:
            [NSURLSessionConfiguration defaultSessionConfiguration]];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [self startMonitoringNetwork];
        self.urlString = urlString;
    }
    return self;
}

- (void)requestWithMethod:(NSString *)methodType params:(id)params completion:(HTTPRequestCompletion)completion {
    NSURLSessionDataTask *task = nil;
    self.completionBlock = completion;
    self.request = [[AFHTTPRequestSerializer serializer]requestWithMethod:methodType URLString:self.urlString parameters:params error:nil];
    self.request.timeoutInterval = 10.0f;
    task  = [self.manager dataTaskWithRequest:self.request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        self.completionBlock(response,responseObject,error);
    }];
    [task resume];
}

- (void)cancelAllRequest {
    [self.manager.operationQueue cancelAllOperations];
}

- (void)cancelRequest:(NSUInteger)index {
    if (self.manager.dataTasks.count >index) {
        NSURLSessionDataTask * task = self.manager.dataTasks[index];
        [task suspend];
    } else {
        NSLog(@"任务不存在");
    }
}

- (void)startMonitoringNetwork {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable||status ==AFNetworkReachabilityStatusUnknown){
            NSLog(@"网络连接已断开，请检查您的网络！");
            return ;
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"你现在使用的是移动数据");
            return;
        }
    }];
}


@end



