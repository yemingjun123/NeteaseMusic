//
//  RankViewModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "RankModel.h"

@interface RankViewModel : BaseViewModel

@property (strong, nonatomic) NSArray<RanksModel *> *modelArray;
@property (strong, nonatomic) NSArray<GroupsModel *> *groupArray;
- (void)refreshDataCompletion:(Completion)complet;

@end


@interface RankSongsViewModel : BaseViewModel

@property (strong, nonatomic) NSArray<RankSongsModel *>*modelArray;
@property (strong, nonatomic) RanksModel *data;

@end
