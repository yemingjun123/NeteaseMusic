//
//  OfficialListCell.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "OfficialListCell.h"
#import "UIImageView+AFNetworking.h"

@implementation OfficialListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setRanksModel:(RanksModel *)ranksModel {
    if (_ranksModel != ranksModel) {
        _ranksModel = ranksModel;
        NSString *img = _ranksModel.img;
        [self.iconImageView setImageWithURL:[NSURL URLWithString:img]];
        self.songName1.text = [self stringInArrayAtIndex:0];
        self.songName2.text = [self stringInArrayAtIndex:1];
        self.songName3.text = [self stringInArrayAtIndex:2];
    }
}


- (NSString *)stringInArrayAtIndex:(NSInteger)index {
    if (_ranksModel.rankSongs.count > index) {
        RankSongsModel *model = [_ranksModel.rankSongs objectAtIndex:index];
        NSString *title = [NSString stringWithFormat:@"%ld. %@-%@",index + 1,model.title,model.singer];
        return title;
    }
    return @"";
}


@end
