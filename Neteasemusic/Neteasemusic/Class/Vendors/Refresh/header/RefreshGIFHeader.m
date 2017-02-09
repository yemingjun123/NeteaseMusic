//
//  RefreshGIFHeader.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshGIFHeader.h"
#import "RefreshConst.h"

@interface RefreshGIFHeader ()

@property (strong, nonatomic) NSMutableDictionary *stateImages;

@end

@implementation RefreshGIFHeader

@synthesize gifImageView = _gifImageView;

- (UIImageView *)gifImageView {
    if (!_gifImageView) {
        UIImageView *gifImageView = [[UIImageView alloc] init];
        [self addSubview:_gifImageView = gifImageView];
    }
    return _gifImageView;
}


- (NSMutableDictionary *)stateImages {
    if (!_stateImages) {
        _stateImages = [[NSMutableDictionary alloc] init];
    }
    return _stateImages;
}

- (void)prepare {
    [super prepare];
//    self.labelLeftInset = RefreshLabelLeftInset;
}

- (void)placeSubViews {
    [super placeSubViews];
    if (self.gifImageView.constraints.count) return;
    self.gifImageView.frame = self.bounds;
    if (self.stateLabel.hidden ) {
        self.gifImageView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifImageView.contentMode = UIViewContentModeRight;
        CGFloat stateWidth = [self.stateLabel.text ymj_boundingSizeWithFont:RefreshLabelFont width:MAXFLOAT].width;
        self.gifImageView.ymj_w = self.ymj_w * 0.5 - stateWidth * 0.5 - self.labelLeftInset / 2;
    }
}

- (void)setImages:(NSArray *)images forState:(RefreshState)state {
    if (images == nil) return;
    self.stateImages[@(state)] = images;
    UIImage *image = [images firstObject];
    if (image.size.height > self.ymj_h) {
        self.ymj_h = image.size.height;
    }
}

- (void)setState:(RefreshState)state {
    RefreshCheckState
    if (state == RefreshStateRefreshing) {
        NSArray *images = self.stateImages[@(state)];
        if (images.count == 0) return;
        [self.gifImageView stopAnimating];
        if (images.count == 1) {
            self.gifImageView.image = [images lastObject];
        } else {
            self.gifImageView.animationImages = images;
            self.gifImageView.animationDuration = images.count * 0.125f;
            [self.gifImageView startAnimating];
        }
    } else if (state == RefreshStateIdle) {
        [self.gifImageView stopAnimating];
    }
}

@end
