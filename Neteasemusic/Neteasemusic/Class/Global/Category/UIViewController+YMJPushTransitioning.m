//
//  UIViewController+YMJPushTransitioning.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/19.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "UIViewController+YMJPushTransitioning.h"
#import <objc/runtime.h>

@implementation UIViewController (YMJPushTransitioning)

static NSString * pushAniamtion_key = @"pushAniamtion_key";
static NSString * popAnimation_key = @"popAnimation_key";

#pragma mark - customTransformation
- (void)setPopAnimation:(YMJAnimation *)popAnimation {
    objc_setAssociatedObject(self, &popAnimation, popAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setPushAnimation:(YMJAnimation *)pushAnimation {
    objc_setAssociatedObject(self, &pushAniamtion_key, pushAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YMJAnimation *)popAnimation {
    return objc_getAssociatedObject(self, &popAnimation_key);
}

- (YMJAnimation *)pushAnimation {
    return objc_getAssociatedObject(self, &pushAniamtion_key);
}

- (void)ymj_popAnimation:(YMJAnimation *)animation {
    self.popAnimation = animation;
    self.navigationController.delegate = self;
}

- (void)ymj_pushAnimation:(YMJAnimation *)animation {
    self.pushAnimation = animation;
    self.navigationController.delegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return (id<UIViewControllerAnimatedTransitioning>)self.pushAnimation;
    } else if (operation == UINavigationControllerOperationPop){
        return (id<UIViewControllerAnimatedTransitioning>)self.popAnimation;
    }
    else {
        return nil;
    }
}


@end
