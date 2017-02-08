//
//  RefreshAutoFooter.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/7.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshFooter.h"

@interface RefreshAutoFooter : RefreshFooter

@property (getter=isAutomaticallyRefresh, nonatomic) BOOL automaticallyRefresh;

@property (assign, nonatomic) CGFloat triggerAutomaticallyRefreshPercent;

@end
