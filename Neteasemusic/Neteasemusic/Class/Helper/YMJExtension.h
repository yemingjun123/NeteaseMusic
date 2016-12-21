//
//  YMJExtension.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Singleton.h"
#import "UIViewController+YMJPushTransitioning.h"
#import "UIView+YMJExtension.h"
#import "UIScrollView+YMJExtension.h"
#import "NSString+YMJExtension.h"

#pragma mark - bounds
#define kSCREENkWIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kSCREENHEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kSCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define kSCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#pragma mark - Notification

#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kUserDefaultAdd(name) [[NSUserDefaults alloc]initWithSuiteName:name]
#define kApplication [UIApplication sharedApplication]

void NotificationAdd(id observer, SEL selector, NSString * name, NSString * alias);
void NotificationPost(NSString * name, NSString * alias, NSDictionary * userInfo);
void NotificationRemove(id observer, NSString * name, NSString * alias);


#pragma mark - new

UIButton *customBarButtonItem(UIImage *image, NSString *title, id target, SEL action);

UIViewController *newClass(NSString *className);

#pragma mark - color

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define whiteColor          0xffffff
#define darkRedColor        0xd43b33
#define darkGrayColor       0x333333
#define lightGrayColor      0x666666

#pragma mark - weak&&strong
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif



