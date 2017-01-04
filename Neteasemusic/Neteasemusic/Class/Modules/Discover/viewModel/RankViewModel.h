//
//  RankViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RankModel.h"

typedef void(^Completion)(BOOL success);

@interface RankViewModel : NSObject

@property (strong, nonatomic) NSArray <RanksModel *> *modelArray;

- (void)refreshDataCompletion:(Completion)complet;


@end
