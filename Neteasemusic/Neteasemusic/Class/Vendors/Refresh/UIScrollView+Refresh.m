//
//  UIScrollView+Refresh.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import "RefreshHeader.h"
#import <objc/runtime.h>

@implementation UIScrollView (Refresh)
static const char RefreshHeaderKey = '\0';
- (void)setNt_header:(RefreshHeader *)nt_header {
    if (self.nt_header != nt_header) {
        [self.nt_header removeFromSuperview];
        [self insertSubview:nt_header atIndex:0];
        [self willChangeValueForKey:@"nt_header"];
        objc_setAssociatedObject(self, &RefreshHeaderKey, nt_header, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"nt_header"];
    }
}

- (RefreshHeader *)nt_header {
    return objc_getAssociatedObject(self, &RefreshHeaderKey);
}

@end
