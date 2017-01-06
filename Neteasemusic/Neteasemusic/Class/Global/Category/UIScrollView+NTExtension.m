//
//  UIScrollView+NTExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "UIScrollView+NTExtension.h"

@implementation UIScrollView (NTExtension)

- (CGFloat)ymj_insetT {
    return self.contentInset.top;
}

- (void)setYmj_insetT:(CGFloat)ymj_insetT {
    UIEdgeInsets inset = self.contentInset;
    inset.top = ymj_insetT;
    self.contentInset = inset;
}

- (CGFloat)ymj_insetL {
    return self.contentInset.left;
}

- (void)setYmj_insetL:(CGFloat)ymj_insetL {
    UIEdgeInsets inset = self.contentInset;
    inset.left = ymj_insetL;
    self.contentInset = inset;
}

- (CGFloat)ymj_insetB {
    return self.contentInset.bottom;
}

- (void)setYmj_insetB:(CGFloat)ymj_insetB {
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = ymj_insetB;
    self.contentInset = inset;
}

- (CGFloat)ymj_insetR {
    return self.contentInset.right;
}

- (void)setYmj_insetR:(CGFloat)ymj_insetR {
    UIEdgeInsets inset = self.contentInset;
    inset.right = ymj_insetR;
    self.contentInset = inset;
}

- (CGFloat)ymj_offsetX {
    return self.contentOffset.x;
}

- (void)setYmj_offsetX:(CGFloat)ymj_offsetX {
    CGPoint offset = self.contentOffset;
    offset.x = ymj_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)ymj_offsetY {
    return self.contentOffset.y;
}

- (void)setYmj_offsetY:(CGFloat)ymj_offsetY {
    CGPoint offset = self.contentOffset;
    offset.y = ymj_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)ymj_contentW {
    return self.contentSize.width;
}

- (void)setYmj_contentW:(CGFloat)ymj_contentW {
    CGSize content = self.contentSize;
    content.width = ymj_contentW;
    self.contentSize = content;
}

- (CGFloat)ymj_contentH {
    return self.contentSize.height;
}

- (void)setYmj_contentH:(CGFloat)ymj_contentH {
    CGSize content = self.contentSize;
    content.height = ymj_contentH;
    self.contentSize = content;
}

@end
