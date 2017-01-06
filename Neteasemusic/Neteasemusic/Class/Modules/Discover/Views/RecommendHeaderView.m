//
//  RecommendHeaderView.m
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RecommendHeaderView.h"
#import "RecommendModel.h"
#import "UIImageView+AFNetworking.h"

@interface RecommendHeaderView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UIImageView *centerImageView;
@property (strong, nonatomic) UIImageView *rightImageView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageContrl;

@end

@implementation RecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    _currentIndex = -1;
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = self.frame;
    self.scrollView.delegate = self ;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(3 * self.ymj_w, 0);
    self.scrollView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.scrollView];
    
    self.pageContrl = [[UIPageControl alloc]init];
    self.pageContrl.frame = CGRectMake((self.frame.size.width - 80)/2, -20, 80, 20);
    self.pageContrl.currentPageIndicatorTintColor = UIColorFromRGB(whiteColor);
    self.pageContrl.pageIndicatorTintColor = UIColorFromRGB(GrayColor);
    self.pageContrl.currentPage = 0;
    [self addSubview:self.pageContrl];
    [self addImageViews];
}

- (void)addImageViews {
    _leftImageView = [[UIImageView alloc]init];
    _rightImageView = [[UIImageView alloc]init];
    _centerImageView = [[UIImageView alloc]init];
    [self.scrollView addSubview:_leftImageView];
    [self.scrollView addSubview:_centerImageView];
    [self.scrollView addSubview:_rightImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.frame.size;
    self.leftImageView.frame   = CGRectMake(0, 0, size.width , size.height);
    self.centerImageView.frame = CGRectMake(size.width * 1, 0, size.width, size.height);
    self.rightImageView.frame  = CGRectMake(size.width * 2, 0, size.width, size.height);
}

- (void)setScrollViewContentOffsetCenter {
    [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.pageContrl.numberOfPages = _dataArray.count;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (_currentIndex != currentIndex) {
        _currentIndex = currentIndex;
        NSInteger leftImageIndex = (_currentIndex + _dataArray.count - 1) % _dataArray.count;
        NSInteger rightImageIndex= (_currentIndex + 1) % _dataArray.count;
        BannerModel *currentModel = _dataArray[_currentIndex];
        BannerModel *leftModel = _dataArray[leftImageIndex];
        BannerModel *rightModel = _dataArray[rightImageIndex];
        
        
        NSLog(@"1 - %@",currentModel.img);
        NSLog(@"2 - %@",leftModel.img);
        NSLog(@"3 - %@",rightModel.img);
        [self.centerImageView setImageWithURL:[NSURL URLWithString:currentModel.img]];
        [self.leftImageView setImageWithURL:[NSURL URLWithString:leftModel.img]];
        [self.rightImageView setImageWithURL:[NSURL URLWithString:rightModel.img]];
        [self setScrollViewContentOffsetCenter];
    }
}

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
