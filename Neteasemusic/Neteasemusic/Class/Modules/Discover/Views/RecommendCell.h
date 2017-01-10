//
//  RecommendCell.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/9.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface RecommendCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playImgView;
@property (strong, nonatomic)        RecommendCmModel *topModel;
@property (strong, nonatomic)        RankSongsModel *songModel;

@end
