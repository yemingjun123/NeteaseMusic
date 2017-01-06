//
//  RankSongHeaderView.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/5.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RankSongHeaderView.h"
#define button_w  45
#define left_sp   35

@implementation RankSongHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = self.frame;
    [self addSubview:self.imageView];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.frame = CGRectMake(20, self.ymj_h - 82, 200, 17);
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = UIColorFromRGB(whiteColor);
    [self addSubview:self.timeLabel];
    
    NSArray *imageArray = @[
                            @"cm2_mv_btn_faved.png",
                            @"cm2_play_icn_cmt.png",
                            @"cm2_topbar_icn_share.png",
                            @"cm2_play_icn_dld.png"
                            ];
    CGFloat space = ((self.ymj_w - left_sp * 2) - button_w * 4) / 3;
    CGFloat buttonY = self.ymj_h - button_w - 20;
    for (int i = 0 ; i < imageArray.count ; i ++) {
        CGFloat buttonX = left_sp + i * space + i * button_w;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, buttonY, button_w, button_w);
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}


@end
