//
//  TapBarPlayButton.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapBarPlayButton : UIView

- (instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action;

- (void)startAnimation;

- (void)stopAnimation;

@end
