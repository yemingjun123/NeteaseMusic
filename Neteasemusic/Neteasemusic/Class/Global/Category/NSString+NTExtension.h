//
//  NSString+NTExtension.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NTExtension)

- (CGSize)ymj_boundingSizeWithFont:(UIFont *)font width:(CGFloat)width;

- (CGRect)ymj_boundingRectWithFont:(UIFont *)font width:(CGFloat)width;

@end
