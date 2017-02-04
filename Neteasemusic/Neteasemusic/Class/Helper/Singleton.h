//
//  Header.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Singleton_H_Class(name) + (instancetype)shared##name;
#define Singleton_M_Class(name) \
static name *instance_ = nil;\
+ (instancetype)shared##name{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        instance_ = [[self alloc] init];\
    });\
    return instance_;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        instance_ = [super allocWithZone:zone];\
    });\
    return instance_;\
}\
- (id)copyWithZone:(NSZone *)zone{\
    return instance_;\
}



#endif /* Header_h */
