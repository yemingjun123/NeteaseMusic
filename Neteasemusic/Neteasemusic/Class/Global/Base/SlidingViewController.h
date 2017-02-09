//
//  PagingViewController.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseViewController.h"
@protocol SlidingViewDelegate,SlidingViewDataSource;

@interface SlidingViewController : BaseViewController

@property (weak, nonatomic) id<SlidingViewDelegate> delegate;
@property (weak, nonatomic) id<SlidingViewDataSource> dataSource;
- (void)reloadData;

@end

@protocol SlidingViewDataSource <NSObject>

@required

- (NSInteger)numberOfPageInSlidingController:(SlidingViewController *)controller;

- (UIViewController *)slidingController:(SlidingViewController *)slidingController controllerAtIndex:(NSInteger)index;

- (NSString *)slidingController:(SlidingViewController *)slidingController titleAtIndex:(NSInteger)index;

@end


@protocol SlidingViewDelegate <NSObject>

@optional

- (void)slidingController:(SlidingViewController *)slidingController selectedIndex:(NSInteger)index;
// selectedController
- (void)slidingController:(SlidingViewController *)slidingController selectedController:(UIViewController *)controller;
// selectedTitle
- (void)slidingController:(SlidingViewController *)slidingController selectedTitle:(NSString *)title;


@end
