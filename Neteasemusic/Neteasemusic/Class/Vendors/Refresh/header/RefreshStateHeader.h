//
//  RefreshStateHeader.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/2/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import "RefreshHeader.h"

@interface RefreshStateHeader : RefreshHeader

@property (assign, nonatomic) CGFloat labelLeftInset;   /** 图片与文字的距离 */

@property (weak, nonatomic, readonly) UILabel *stateLabel;

@end
