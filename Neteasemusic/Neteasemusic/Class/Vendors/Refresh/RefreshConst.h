//
//  RefreshConst.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>


#define RefreshLabelFont [UIFont systemFontOfSize:14]
#define RefreshLabelTextColor UIColorFromRGB(0x666666)

UIKIT_EXTERN const CGFloat RefreshLabelLeftInset;
UIKIT_EXTERN const CGFloat RefreshHeaderHeight;
UIKIT_EXTERN const CGFloat RefreshFooterHeight;
UIKIT_EXTERN const CGFloat RefreshFastAnimationDuration;
UIKIT_EXTERN const CGFloat RefreshSlowAnimationDuration;

UIKIT_EXTERN NSString *const RefreshKeyPathContentOffset;
UIKIT_EXTERN NSString *const RefreshKeyPathContentInset;
UIKIT_EXTERN NSString *const RefreshKeyPathContentSize;
UIKIT_EXTERN NSString *const RefreshKeyPathPanState;

UIKIT_EXTERN NSString *const RefreshHeaderLastUpdatedKey;

UIKIT_EXTERN NSString *const RefreshAutoFonterIdleText;
UIKIT_EXTERN NSString *const RefreshAutoFonterRefreshingText;
UIKIT_EXTERN NSString *const RefreshAutoFonterNoMoreDataText;

UIKIT_EXTERN NSString *const RefreshHeaderIdleText;
UIKIT_EXTERN NSString *const RefreshHeaderPullingText;
UIKIT_EXTERN NSString *const RefreshHeaderRefreshingText;


#define RefreshCheckState \
RefreshState oldState = self.state; \
if (state == oldState) return; \
[super setState:state];
