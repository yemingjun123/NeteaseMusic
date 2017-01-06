//
//  RecommendViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecommendModel.h"

typedef void(^Completion)(BOOL success);

@interface RecommendViewModel : NSObject

@property (strong, nonatomic) RecommendModel *dataModel;
@property (strong, nonatomic) NSArray <RecommendGroupModel *> *dataArray;

- (void)refreshDataCompletion:(Completion)complet;

@end
