//
//  AudioDataBase.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/13.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioModelBase : NSObject

@property (copy, nonatomic) NSString *url;


- (void)start;
- (void)cancel;


@end
