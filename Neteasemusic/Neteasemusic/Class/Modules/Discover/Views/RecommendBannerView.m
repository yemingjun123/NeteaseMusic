//
//  RecommendHeaderView.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendBannerView.h"
#import "UIImageView+AFNetworking.h"

@interface RecommendBannerView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView   *leftImageView;
@property (strong, nonatomic) UIImageView   *centerImageView;
@property (strong, nonatomic) UIImageView   *rightImageView;
@property (strong, nonatomic) UIScrollView  *scrollView;
@property (strong, nonatomic) UIPageControl *pageContrl;

@end

@implementation RecommendBannerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBannerUI];
    }
    return self;
}

- (void)setBannerUI {
//    _currentIndex = -1;
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = CGRectMake(0, 0, self.ymj_w, self.ymj_h);
    self.scrollView.delegate = self ;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(3 * self.ymj_w, 0);
    self.scrollView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.scrollView];
    
    self.pageContrl = [[UIPageControl alloc]init];
    self.pageContrl.frame = CGRectMake((self.ymj_w - 80) / 2, self.ymj_h - 20, 80, 20);
    self.pageContrl.currentPageIndicatorTintColor = UIColorFromRGB(whiteColor);
    self.pageContrl.pageIndicatorTintColor = UIColorFromRGB(GrayColor);
    self.pageContrl.currentPage = 0;
    [self addSubview:self.pageContrl];
    [self addImageViews];
}

- (void)addImageViews {
    self.leftImageView  = [[UIImageView alloc]init];
    self.rightImageView = [[UIImageView alloc]init];
    self.centerImageView = [[UIImageView alloc]init];
    self.leftImageView.frame   = CGRectMake(0, 0, self.ymj_w , self.ymj_h);
    self.centerImageView.frame = CGRectMake(self.ymj_w * 1, 0, self.ymj_w, self.ymj_h);
    self.rightImageView.frame  = CGRectMake(self.ymj_w * 2, 0, self.ymj_w, self.ymj_h);
    [self.scrollView addSubview:self.leftImageView];
    [self.scrollView addSubview:self.centerImageView];
    [self.scrollView addSubview:self.rightImageView];
}

#pragma mark - setter
- (void)setScrollViewContentOffsetCenter {
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
}

- (void)setDataArray:(NSArray<BannerModel *> *)dataArray {
    _dataArray = dataArray;
    self.pageContrl.numberOfPages = _dataArray.count;
    self.currentIndex = 1;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (_currentIndex != currentIndex) {
        _currentIndex = currentIndex;
        NSInteger leftImageIndex  = (_currentIndex + _dataArray.count - 1) % _dataArray.count;
        NSInteger rightImageIndex = (_currentIndex + 1) % _dataArray.count;
        BannerModel *currentModel = self.dataArray[_currentIndex];
        BannerModel *leftModel    = self.dataArray[leftImageIndex];
        BannerModel *rightModel   = self.dataArray[rightImageIndex];
        [self.centerImageView setImageWithURL:[NSURL URLWithString:currentModel.img]];
        [self.leftImageView setImageWithURL:[NSURL URLWithString:leftModel.img]];
        [self.rightImageView setImageWithURL:[NSURL URLWithString:rightModel.img]];
        [self setScrollViewContentOffsetCenter];
    }
}

#pragma mark - delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    if (offset.x > CGRectGetWidth(self.frame)) {
        self.currentIndex = (_currentIndex + 1) %  _dataArray.count;
    }
    else if(offset.x < CGRectGetWidth(self.frame)){
        self.currentIndex= (_currentIndex + _dataArray.count - 1) % _dataArray.count;
    }
}

@end
