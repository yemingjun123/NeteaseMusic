//
//  NSString+NTExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "NSString+NTExtension.h"

@implementation NSString (NTExtension)

- (CGSize)ymj_stringSizeWithFont:(UIFont *)font width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
        attributes:@{NSFontAttributeName : font} context:nil].size;
}


@end
