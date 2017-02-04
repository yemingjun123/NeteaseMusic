//
//  AudioProperty.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/13.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "AudioProperty.h"

@implementation AudioProperty

- (void)setState:(AudioPlayerState)state {
    if (_state != state) {
        _state = state;
    }
}

@end
