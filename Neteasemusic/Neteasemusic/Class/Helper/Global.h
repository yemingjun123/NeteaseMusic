//
//  Global.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YMJExtension.h"
#define kSCREENkWIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kSCREENHEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kSCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define kSCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define UIColorFromRGB(rgbValue) [UIColor \
    colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
    blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kUserDefaultAdd(name) [[NSUserDefaults alloc]initWithSuiteName:name]
#define kApplication [UIApplication sharedApplication]
