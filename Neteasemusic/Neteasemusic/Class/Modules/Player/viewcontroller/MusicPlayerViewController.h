//
//  PlayMusicViewController.h
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "BaseViewController.h"

@interface MusicPlayerViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *artist;

- (IBAction)touchPlayEvent:(UIButton *)sender;
- (IBAction)touchNextEvent:(UIButton *)sender;
- (IBAction)touchPrevEvent:(UIButton *)sender;
- (IBAction)touchPlayModeEvent:(UIButton *)sender;
- (IBAction)touchPlayListEvent:(UIButton *)sender;
- (IBAction)touchBackEvent:(UIButton *)sender;
- (IBAction)touchShareEvent:(UIButton *)sender;

@end
