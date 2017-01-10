//
//  SongMenuCell.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "SongMenuCell.h"
#import "UIImageView+AFNetworking.h"

@implementation SongMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(SongMenuList *)model {
    if (_model != model) {
        _model = model;
        [self.imageView setImageWithURL:[NSURL URLWithString:_model.img]];
        self.summaryLabel.text = _model.summary;
    }
}

@end
