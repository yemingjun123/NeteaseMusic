//
//  RecommendTagView.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendTagView.h"

@interface RecommendTagView ()

@property (strong, nonatomic) UIImageView   *leftImageView;
@property (strong, nonatomic) UILabel       *titleLabel;

@end

@implementation RecommendTagView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTagUI];
    }
    return self;
}

- (void)setTagUI {
    self.leftImageView = [UIImageView new];
    UIImage *image = [UIImage imageNamed:@"cm2_discover_icn_exclusive.png"];
    self.leftImageView.frame = CGRectMake(10, 20, image.size.width, image.size.height);
    self.leftImageView.image = image;
    [self addSubview:self.leftImageView];

    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = UIColorFromRGB(darkGrayColor);
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.ymj_x = CGRectGetMaxX(self.leftImageView.frame) + 10;
    self.titleLabel.ymj_y = CGRectGetMinY(self.leftImageView.frame);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = _title;
    [self.titleLabel sizeToFit];
    [self setNeedsLayout];
}

@end
