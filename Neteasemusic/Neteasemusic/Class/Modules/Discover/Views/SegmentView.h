//
//  SegmentView.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentViewDelegate <NSObject>

@required

- (void)didSelectedIndex:(NSInteger)index;

@end

@interface SegmentView : UIView

@property (weak, nonatomic) id<SegmentViewDelegate> delegate;

@property (strong, nonatomic) UIColor *textColor;

@property (strong, nonatomic) UIColor *selectedColor;

@property (strong, nonatomic) UIFont *font;

@property (assign, nonatomic) CGSize lineSize;

@property (strong, nonatomic) NSArray *dataArray;

- (void)selectedIndex:(NSInteger)index;

@end
