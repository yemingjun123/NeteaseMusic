//
//  RankSongsCell.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankSongsCell.h"

@implementation RankSongsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(RankSongsModel *)model {
    if (_model != model) {
        _model = model;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",_model.number + 1];
        self.numberLabel.textColor = _model.numberColor;
        NSString *string = [NSString stringWithFormat:@"%@ - %@",_model.singer,_model.title];
        self.singerLanel.text = string;
        self.songNameLabel.text = _model.title;
    }
}

- (IBAction)touchMoreEvent:(UIButton *)sender {
}

@end
