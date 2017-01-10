//
//  SongMenuCell.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongMenuModel.h"

@interface SongMenuCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic)        SongMenuList *model;

@end
