//
//  RankModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@class GroupsModel,RanksModel,RankSongsModel;

@interface RankModel : NSObject

@property (strong, nonatomic) GroupsModel *groups;

@end

@interface GroupsModel : NSObject

@property (strong, nonatomic) NSMutableArray<RanksModel *> *ranks;
@property (copy, nonatomic) NSString *tag;

@end

@interface RanksModel : NSObject

@property (strong, nonatomic) NSMutableArray<RankSongsModel *> *rankSongs;
@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *url;

@end

@interface RankSongsModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *singerid;
@property (copy, nonatomic) NSString *singer;

@end
