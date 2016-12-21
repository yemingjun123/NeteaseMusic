//
//  BaseViewController.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)setColor:(UIColor *)color;

- (void)setMiddleLabelTitle:(NSString *)title color:(UIColor *)color;

- (void)setMiddleSegmentedItems:(NSArray *)items target:(id)target action:(SEL)action ;

- (void)setLeftBarButton:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action;

- (void)setRightBarButton:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action;

@end
