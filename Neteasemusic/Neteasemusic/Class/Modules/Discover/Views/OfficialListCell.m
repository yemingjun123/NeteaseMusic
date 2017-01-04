//
//  OfficialListCell.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "OfficialListCell.h"
#import "UIImageView+AFNetworking.h"
//#import "MJExtension.h"

@implementation OfficialListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setRanksModel:(RanksModel *)ranksModel {
    if (_ranksModel != ranksModel) {
//        RanksModel *model = [RanksModel mj_objectWithKeyValues:ranksModel];
        NSString *img = _ranksModel.img;
        [self.iconImageView setImageWithURL:[NSURL URLWithString:img]];
    
    }
}

@end
