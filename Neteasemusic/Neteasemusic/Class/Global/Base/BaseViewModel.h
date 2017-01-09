//
//  BaseViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(BOOL success);

@interface BaseViewModel : NSObject

@property (copy, nonatomic)     Completion completionBlock;
@property (strong, nonatomic)   id responseObject;

- (void)refreshDataUrl:(NSString *)url pramas:(NSDictionary *)pramas completion:(Completion)complet;

@end
