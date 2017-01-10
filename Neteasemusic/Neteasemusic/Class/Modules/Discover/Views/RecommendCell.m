//
//  RecommendCell.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendCell.h"
#import "UIImageView+AFNetworking.h"

@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTopModel:(RecommendCmModel *)topModel {
    if (_topModel != topModel) {
        _topModel = topModel;
        [self.imageView setImageWithURL:[NSURL URLWithString:_topModel.img]];
        self.summaryLabel.numberOfLines = 2;
        self.summaryLabel.text = _topModel.summary;
    }
}


- (void)setSongModel:(RankSongsModel *)songModel {
    if (_songModel != songModel) {
        _songModel = songModel;
        [self.imageView setImageWithURL:[NSURL URLWithString:_songModel.singerIcon]];
        self.summaryLabel.text = _songModel.title;
        self.summaryLabel.numberOfLines = 1;
        self.singerLabel.text = _songModel.singer;
    }
}

@end
