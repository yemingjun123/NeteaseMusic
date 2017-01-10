//
//  RankSongsCell.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankModel.h"

@interface RankSongsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLanel;
@property (weak, nonatomic) IBOutlet UIImageView *sqImageView;
@property (strong, nonatomic)        RankSongsModel *model;

- (IBAction)touchMoreEvent:(UIButton *)sender;

@end
