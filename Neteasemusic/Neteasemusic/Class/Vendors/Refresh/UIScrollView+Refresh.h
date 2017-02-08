//
//  UIScrollView+Refresh.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RefreshHeader,RefreshFooter;

@interface UIScrollView (Refresh)

@property (strong, nonatomic) RefreshHeader *nt_header;  /** 下拉刷新 */
@property (strong, nonatomic) RefreshFooter *nt_footer;  /** 上拉刷新 */

@end
