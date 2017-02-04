//
//  AudioProperty.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/13.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

typedef NS_ENUM(NSUInteger, AudioPlayerState) {
    AudioStateInit,
    AudioStateWaiting,
    AudioStatePlaying,
    AudioStatePaused,
    AudioStateStop
};


@interface AudioProperty : NSObject

@property (assign, nonatomic) AudioPlayerState state;

@end
