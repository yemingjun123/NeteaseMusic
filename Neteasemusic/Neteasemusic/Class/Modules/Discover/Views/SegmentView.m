//
//  SegmentView.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "SegmentView.h"

@interface SegmentView ()

@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) UIView *lineView;

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.buttons = [[NSMutableArray alloc]init];
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = UIColorFromRGB(darkGrayColor);
        self.selectedColor = UIColorFromRGB(darkRedColor);
    }
    return self;
}

- (void)setSubSegmentItem {
    [self.buttons removeAllObjects];
    CGFloat buttonW = self.ymj_w / self.dataArray.count;
    for (int i = 0 ; i < self.dataArray.count ; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * buttonW, 0, buttonW, self.ymj_h);
        button.tag = i + 1;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[self.dataArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:self.textColor forState:UIControlStateNormal];
        [button setTitleColor:self.selectedColor forState:UIControlStateSelected];
        button.titleLabel.font = self.font;
        [button addTarget:self action:@selector(touchButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            button.selected = YES;
        } else{
            button.selected = NO;
        }
        [self.buttons addObject:button];
        [self addSubview:button];
    }
    self.lineView = [[UIView alloc]init];
    UIButton *button = self.buttons[0];
    CGSize size = [button.titleLabel.text ymj_boundingSizeWithFont:self.font width:button.ymj_w];
    self.lineView.frame = CGRectMake((button.ymj_w - size.width + 5) / 2, self.ymj_h - 2, size.width + 5, 2);
    self.lineView.backgroundColor = self.selectedColor;
    [self addSubview:self.lineView];
}

- (void)touchButtonEvent:(UIButton *)selectedButton {
    @weakify(self)
    [UIView animateWithDuration:0.2 animations:^{
        @strongify(self)
        CGSize size = [selectedButton.titleLabel.text ymj_boundingSizeWithFont:self.font width:selectedButton.ymj_w];
        self.lineView.ymj_w = size.width + 5;
        self.lineView.ymj_x = selectedButton.ymj_x + (selectedButton.ymj_w - self.lineView.ymj_w) / 2;
    }];
    for (UIButton *button in self.buttons) {
        if (button == selectedButton) {
            button.selected = YES;
        } else {
            button.selected = NO;
        }
    }
    if ([self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:selectedButton.tag - 1];
    }
}

- (void)selectedIndex:(NSInteger)index {
    for (UIButton *button in self.buttons) {
        if (index != button.tag) {
            button.selected = NO;
        } else {
            @weakify(self)
            [UIView animateWithDuration:0.2 animations:^{
                @strongify(self)
                CGSize size = [button.titleLabel.text ymj_boundingSizeWithFont:self.font width:button.ymj_w];
                self.lineView.ymj_w = size.width + 5;
                self.lineView.ymj_x = button.ymj_x + (button.ymj_w - self.lineView.ymj_w) / 2;
            } completion:^(BOOL finished) {
                button.selected = YES;
            }];
        }
    }
}

#pragma mark -- set
- (void)setDataArray:(NSArray *)dataArray {
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        [self setSubSegmentItem];
    }
}

- (void)setTextColor:(UIColor *)textColor{
    if (_textColor != textColor) {
        _textColor = textColor;
        for (UIButton *button in self.buttons) {
            [button setTitleColor:textColor forState:UIControlStateNormal];
        }
    }
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    if (_selectedColor != selectedColor) {
        _selectedColor = selectedColor;
        for (UIButton *button in self.buttons) {
            [button setTitleColor:selectedColor forState:UIControlStateSelected];
        }
    }
}

- (void)setFont:(UIFont *)font {
    if (_font != font) {
        _font = font;
        for (UIButton *button in self.buttons) {
            button.titleLabel.font = font;
        }
    }
}


@end
