//
//  UIView+NTExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "UIView+NTExtension.h"

@implementation UIView (NTExtension)

- (CGFloat)ymj_x {
    return CGRectGetMinX(self.frame);
}

- (void)setYmj_x:(CGFloat)ymj_x {
    CGRect frame = self.frame;
    frame.origin.x = ymj_x;
    self.frame = frame;
}

- (CGFloat)ymj_y {
    return CGRectGetMinY(self.frame);
}

- (void)setYmj_y:(CGFloat)ymj_y {
    CGRect frame = self.frame;
    frame.origin.y = ymj_y;
    self.frame = frame;
}

- (CGFloat)ymj_w {
    return CGRectGetWidth(self.frame);
}

- (void)setYmj_w:(CGFloat)ymj_w {
    CGRect frame = self.frame;
    frame.size.width = ymj_w;
    self.frame = frame;
}

- (CGFloat)ymj_h {
    return CGRectGetHeight(self.frame);
}

- (void)setYmj_h:(CGFloat)ymj_h {
    CGRect frame = self.frame;
    frame.size.height = ymj_h;
    self.frame = frame;
}

- (CGSize)ymj_size {
    return self.frame.size;
}

- (void)setYmj_size:(CGSize)ymj_size {
    CGRect frame = self.frame;
    frame.size = ymj_size;
    self.frame = frame;
}

- (CGPoint)ymj_origin {
    return self.frame.origin;
}

- (void)setYmj_origin:(CGPoint)ymj_origin {
    CGRect frame = self.frame;
    frame.origin = ymj_origin;
    self.frame = frame;
}


@end
