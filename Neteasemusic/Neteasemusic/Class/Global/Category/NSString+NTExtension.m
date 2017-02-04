//
//  NSString+NTExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "NSString+NTExtension.h"

static const NSUInteger options = NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin;

@implementation NSString (NTExtension)

- (CGSize)ymj_boundingSizeWithFont:(UIFont *)font width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options
        attributes:@{NSFontAttributeName : font} context:NULL].size;
}

- (CGRect)ymj_boundingRectWithFont:(UIFont *)font width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options attributes:@{NSFontAttributeName : font} context:NULL];
}


@end
