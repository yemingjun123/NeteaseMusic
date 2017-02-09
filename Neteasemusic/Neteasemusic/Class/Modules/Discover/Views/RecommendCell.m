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
        
        self.summaryLabel.text = nil;
        self.singerLabel.text = nil;
        self.summaryLabel.numberOfLines = 2;
        self.imageView.image = [UIImage new];
        
        [self.imageView setImageWithURL:[NSURL URLWithString:_topModel.img]];
        self.summaryLabel.text = _topModel.summary;
    }
}


- (void)setSongModel:(RankSongsModel *)songModel {
    if (_songModel != songModel) {
        _songModel = songModel;
   
        self.summaryLabel.text = nil;
        self.singerLabel.text = nil;
        self.summaryLabel.numberOfLines = 1;
        self.imageView.image = [UIImage new];
        
        [self.imageView setImageWithURL:[NSURL URLWithString:_songModel.singerIcon]];
        self.summaryLabel.text = _songModel.title;
        self.singerLabel.text = _songModel.singer;
    }
}

@end
