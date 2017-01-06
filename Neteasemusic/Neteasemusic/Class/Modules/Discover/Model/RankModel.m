//
//  RankModel.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankModel.h"

@implementation RankModel

@end


@implementation GroupsModel

@end


@implementation RanksModel

@end


@implementation RankSongsModel

- (void)setNumber:(NSInteger)number {
    _number = number;
    if (_number >= 3) {
        self.numberColor = UIColorFromRGB(GrayColor);
    } else {
        self.numberColor = UIColorFromRGB(DarkOrangeColor);
    }
}

@end
