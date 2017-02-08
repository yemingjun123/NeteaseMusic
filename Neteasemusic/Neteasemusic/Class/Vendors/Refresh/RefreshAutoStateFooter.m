//
//  RefreshAutoStateFooter.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/7.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshAutoStateFooter.h"

@interface RefreshAutoStateFooter ()

@property (strong, nonatomic) NSMutableDictionary *stateTitles;

@end

@implementation RefreshAutoStateFooter

@synthesize stateLabel = _stateLabel,loadingView = _loadingView;

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

- (UIActivityIndicatorView *)loadingView {
    if (_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setTitle:(NSString *)title forState:(RefreshState)state {
    if (title == nil) return;
    self.stateTitles[@(state)] = title;
    self.stateLabel.text = self.stateTitles[@(self.state)];
}

- (void)prepare {
    [super prepare];
    self.labelLeftInset = RefreshLabelLeftInset;
    [self setTitle:RefreshAutoFonterIdleText forState:RefreshStateIdle];
    [self setTitle:RefreshAutoFonterRefreshingText forState:RefreshStateRefreshing];
    [self setTitle:RefreshAutoFonterNoMoreDataText forState:RefreshStateNoMoreData];
    
    self.stateLabel.userInteractionEnabled = YES;
    [self.stateLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchStateLabelEvent)]];
}

- (void)placeSubViews {
    [super placeSubViews];
    
    if (self.stateLabel.constraints.count) return;
    self.stateLabel.frame = self.bounds;
    
    if (self.loadingView.constraints.count) return;
    CGFloat loadingCenterX = self.ymj_w * 0.5;
    CGFloat textWidth = [self.stateLabel.text ymj_boundingSizeWithFont:RefreshLabelFont width:MAXFLOAT].width;
    if (!self.isRefreshingTitleHidden) {
        loadingCenterX -= textWidth * 0.5 + self.labelLeftInset;
    }
    CGFloat loadingCenterY = self.ymj_h * 0.5;
    self.loadingView.center = CGPointMake(loadingCenterX, loadingCenterY);
}

- (void)setState:(RefreshState)state {
    RefreshCheckState
    if (self.isRefreshingTitleHidden && state == RefreshStateRefreshing) {
        self.stateLabel.text = nil;
    } else if (state == RefreshStateRefreshing) {
        self.stateLabel.text = self.stateTitles[@(state)];
        [self.loadingView startAnimating];
    } else {
        self.stateLabel.text = self.stateTitles[@(state)];
        [self.loadingView stopAnimating];
    }
}

- (void)touchStateLabelEvent {
    if (self.state == RefreshStateIdle) {
        [self beginRefreshing];
    }
}

@end


