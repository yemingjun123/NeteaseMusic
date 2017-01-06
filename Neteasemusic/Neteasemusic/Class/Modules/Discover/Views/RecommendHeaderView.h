//
//  RecommendHeaderView.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface RecommendHeaderView : UIView

@property (assign, nonatomic) NSInteger currentIndex ;

@property (strong, nonatomic) NSArray <BannerModel *>*dataArray;

@end
