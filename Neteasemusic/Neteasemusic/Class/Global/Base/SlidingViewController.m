//
//  PagingViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/21.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "SlidingViewController.h"
#import "SegmentView.h"

@interface SlidingViewController () <UIPageViewControllerDelegate,UIPageViewControllerDataSource,SegmentViewDelegate>

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) SegmentView *segmentView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *segmentTitles;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger willIndex;
@end

@implementation SlidingViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
    //segmentTapView
    self.segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, self.view.ymj_w, 40)];
    self.segmentView.delegate = self;
    [self.view addSubview:self.segmentView];
    
    //pageController
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.view.frame = CGRectMake(0, 40, self.view.ymj_w, self.view.ymj_h - 40);
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - loadData
- (void)reloadData {
    [self.viewControllers removeAllObjects];
    [self.segmentTitles removeAllObjects];
    NSInteger num = 0;
    if ([self.dataSource respondsToSelector:@selector(numberOfPageInSlidingController:)]) {
        num = [self.dataSource numberOfPageInSlidingController:self];
    }
    for (NSInteger i = 0 ; i < num; i ++) {
        if ([self.dataSource respondsToSelector:@selector(slidingController:controllerAtIndex:)]) {
            UIViewController *vc = [self.dataSource slidingController:self controllerAtIndex:i];
            [self.viewControllers addObject:vc];
        }
    }
    for (NSInteger i = 0 ; i < num; i ++) {
        if ([self.dataSource respondsToSelector:@selector(slidingController:titleAtIndex:)]) {
            NSString *title = [self.dataSource slidingController:self titleAtIndex:i];
            [self.segmentTitles addObject:title];
        }
    }
    self.segmentView.dataArray = self.segmentTitles;
    [self.pageController setViewControllers:@[self.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (NSMutableArray *)viewControllers{
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
    }
    return _viewControllers;
}

- (NSMutableArray *)segmentTitles{
    if (!_segmentTitles) {
        _segmentTitles = [NSMutableArray array];
    }
    return _segmentTitles;
}

- (void)callBackWithIndex:(NSInteger)index{
    self.currentIndex = index;
    if ([self.delegate respondsToSelector:@selector(slidingController:selectedController:)]) {
        [self.delegate slidingController:self selectedController:self.viewControllers[index]];
    }
    if ([self.delegate respondsToSelector:@selector(slidingController:selectedTitle:)]) {
        [self.delegate slidingController:self selectedTitle:self.segmentTitles[index]];
    }
    if ([self.delegate respondsToSelector:@selector(slidingController:selectedIndex:)]) {
        [self.delegate slidingController:self selectedIndex:index];
    }
}


#pragma mark - delegate
//UIPageViewControllerDataSource
-(NSInteger)indexOfViewController:(UIViewController *)viewController{
    return [self.viewControllers indexOfObject:viewController];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound || index == 0) {
        return nil;
    };
    return self.viewControllers[index - 1];
}
   
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound || index == self.viewControllers.count - 1) {
        return nil;
    }
    return self.viewControllers[index + 1];
}

// UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    NSInteger index = [self indexOfViewController:pendingViewControllers[0]];
    self.willIndex = index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if(completed){
        NSInteger index = [self indexOfViewController:previousViewControllers[0]];
        NSInteger nextIndex = 0;
        if (index > self.willIndex) {
            nextIndex = index - 1;
        }else if (index < self.willIndex){
            nextIndex = index + 1;
        }
        [self.segmentView selectedIndex:nextIndex + 1];
        [self callBackWithIndex:nextIndex];
    }
}

// SegmentViewDelegate
- (void)didSelectedIndex:(NSInteger)index {
    @weakify(self)
    if (self.currentIndex == 0) {
        [self.pageController setViewControllers:@[self.viewControllers[index]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
            @strongify(self)
            [self callBackWithIndex:index];
        }];
    }else if (self.currentIndex < index){
        [self.pageController setViewControllers:@[self.viewControllers[index]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
            @strongify(self)
            [self callBackWithIndex:index];
        }];
    }else{
        [self.pageController setViewControllers:@[self.viewControllers[index]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
            @strongify(self)
            [self callBackWithIndex:index];
        }];
    }
}




@end
