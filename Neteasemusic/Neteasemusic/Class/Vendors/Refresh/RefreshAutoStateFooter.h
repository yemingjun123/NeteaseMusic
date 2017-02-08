//
//  RefreshAutoStateFooter.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/7.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshAutoFooter.h"

@interface RefreshAutoStateFooter : RefreshAutoFooter

@property(assign, nonatomic) CGFloat labelLeftInset;

@property (weak, nonatomic, readonly) UILabel *stateLabel;

@property (weak, nonatomic, readonly) UIActivityIndicatorView *loadingView;

@property (getter=isRefreshingTitleHidden, nonatomic) BOOL refreshingTitleHidden;

@end
