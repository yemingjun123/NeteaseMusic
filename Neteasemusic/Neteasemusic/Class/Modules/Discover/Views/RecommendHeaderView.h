//
//  RecommendHeaderView.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

typedef NS_ENUM(NSUInteger, RecommendHeaderStyle) {
    RecommendHeaderBanner,
    RecommendHeaderTag
};

@interface RecommendHeaderView : UIView

@property (assign, nonatomic) NSInteger currentIndex ;
@property (strong, nonatomic) NSArray <BannerModel *>*dataArray;
@property (copy, nonatomic)   NSString *title;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(RecommendHeaderStyle)style;

@end
