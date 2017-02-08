//
//  RefreshStateHeader.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshStateHeader.h"
#import "RefreshConst.h"

@interface RefreshStateHeader ()

@property (strong, nonatomic) NSMutableDictionary *stateTitles;
@property (strong, nonatomic) UIImageView *arrowImageView;

@end


@implementation RefreshStateHeader

@synthesize stateLabel = _stateLabel;

#pragma mark - getter
- (UILabel *)stateLabel {
    if (!_stateLabel) {
        [self addSubview:_stateLabel = [UILabel _label]];
    }
    return _stateLabel;
}

- (NSMutableDictionary *)stateTitles {
    if (!_stateTitles) {
        _stateTitles = [[NSMutableDictionary alloc] init];
    }
    return _stateTitles;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        UIImage *image = [UIImage imageNamed:@"MCTableViewArrow.png"];
        _arrowImageView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:_arrowImageView];
    }
    return _arrowImageView;
}


- (void)setTitle:(NSString *)title forState:(RefreshState)state {
    if (!title) return ;
    self.stateTitles[@(state)] = title;
    self.stateLabel.text = self.stateTitles[@(self.state)];
}

#pragma mark - 重写父类
- (void)prepare {
    [super prepare];
    self.labelLeftInset = RefreshLabelLeftInset;
    [self setTitle:RefreshHeaderIdleText forState:RefreshStateIdle];
    [self setTitle:RefreshHeaderPullingText forState:RefreshStatePulling];
    [self setTitle:RefreshHeaderRefreshingText forState:RefreshStateRefreshing];
}

- (void)placeSubViews {
    [super placeSubViews];
    
    if (self.stateLabel.constraints.count == 0) {
        self.stateLabel.frame = self.bounds;
    }
    CGFloat arrowCenterX = self.ymj_w * 0.5;
    CGFloat stateWidth = [self.stateLabel.text ymj_boundingSizeWithFont:RefreshLabelFont width:MAXFLOAT].width;
    arrowCenterX -= stateWidth / 2 + self.labelLeftInset;

    CGFloat arrowCenterY = self.ymj_h * 0.5;
    CGPoint arrowCenter = CGPointMake(arrowCenterX, arrowCenterY);
    
    if (self.arrowImageView.constraints.count == 0) {
        self.arrowImageView.ymj_size = self.arrowImageView.image.size;
        self.arrowImageView.center = arrowCenter;
    }
}

- (void)setState:(RefreshState)state {
    RefreshCheckState
    self.stateLabel.text = self.stateTitles[@(state)];
    if (state == RefreshStateIdle) {
        if (oldState == RefreshStateRefreshing) {
            self.arrowImageView.transform = CGAffineTransformIdentity;
            [UIView animateWithDuration:RefreshSlowAnimationDuration animations:^{
            } completion:^(BOOL finished) {
                if (self.state != RefreshStateIdle) return;
                self.arrowImageView.hidden = NO;
            }];
        } else {
            self.arrowImageView.hidden = NO;
            [UIView animateWithDuration:RefreshFastAnimationDuration animations:^{
                self.arrowImageView.transform = CGAffineTransformIdentity;
            }];
        }
    } else if (state == RefreshStatePulling) {
        self.arrowImageView.hidden = NO;
        [UIView animateWithDuration:RefreshFastAnimationDuration animations:^{
            self.arrowImageView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
        }];
    } else if (state == RefreshStateRefreshing) {
        self.arrowImageView.hidden = YES;
    }
}

@end

@interface RefreshGIFHeader()

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

- (void)prepare {
    [super prepare];
    self.labelLeftInset = RefreshLabelLeftInset;
}

- (NSMutableDictionary *)stateImages {
    if (!_stateImages) {
        _stateImages = [[NSMutableDictionary alloc] init];
    }
    return _stateImages;
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
            self.gifImageView.animationDuration = images.count * 0.1f;
            [self.gifImageView startAnimating];
        }
    } else if (state == RefreshStateIdle) {
        [self.gifImageView stopAnimating];
    }
}

@end
