//
//  TapBarPlayButton.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBarPlayButton : UIView

SINGLETON_H_CLASS(TopBarPlayButton);

- (void)addTarget:(id)target action:(SEL)action;

- (void)startAnimation;

- (void)stopAnimation;

@end
