//
//  UIViewController+YMJPushTransitioning.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMJAnimation.h"

@interface UIViewController (YMJPushTransitioning)<UINavigationControllerDelegate>

@property (strong, nonatomic)YMJAnimation *popAnimation;
@property (strong, nonatomic)YMJAnimation *pushAnimation;

- (void)ymj_pushAnimation:(YMJAnimation*)animation;
- (void)ymj_popAnimation:(YMJAnimation *)animation;

@end
