//
//  YMJExtension.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "YMJExtension.h"
#import <objc/runtime.h>

typedef id (*_IMP)(id, SEL, ...);

#pragma mark - Notification

void NotificationAdd(id observer, SEL selector, NSString * name, NSString * alias) {
    [kNotificationCenter addObserver:observer selector:selector name:name object:alias];
}

void NotificationPost(NSString * name, NSString * alias, NSDictionary * userInfo) {
    [kNotificationCenter postNotificationName:name object:alias userInfo:userInfo];
}

void NotificationRemove(id observer, NSString * name, NSString * alias) {
    [kNotificationCenter removeObserver:observer name:name object:alias];
}

#pragma mark - UIButton
UIButton *customBarButtonItem(UIImage *image, NSString *title, id target, SEL action) {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 44, 44);
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.frame = CGRectMake(0, 0, 70 , 44);
        [button setTitleColor:UIColorFromRGB(whiteColor) forState:UIControlStateNormal];
    }
    return button;
}


UIViewController *newClass(NSString *className) {
    Class  cls =  NSClassFromString(className);
    Method method = class_getClassMethod(cls, NSSelectorFromString(@"instantiate"));
    UIViewController *vc= nil;
    if (method != nil) {
        SEL instantiateSel = method_getName(method);
        _IMP imp = (_IMP)method_getImplementation(method);
        vc = imp(cls,instantiateSel);
    }else{
        vc =[[cls alloc] init];
    }
    return vc;
}

