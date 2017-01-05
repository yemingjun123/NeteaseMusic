//
//  RankSongHeaderView.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/5.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankSongHeaderView.h"

@implementation RankSongHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = self.frame;
        [self addSubview:_imageView];
    }
    return _imageView;
}

@end
