//
//  SongMemuModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/10.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SongMenuList,Owner;

@interface SongMenuModel : NSObject


@property (strong, nonatomic) NSArray <SongMenuList *>*list;
@property (copy, nonatomic)   NSString *pagecount;
@property (copy, nonatomic)   NSString *totalcount;
@property (copy, nonatomic)   NSString *groupcode;
@property (copy, nonatomic)   NSString *publishTime;

@end
/*
 "owner": {
 },
 "tagNames": "流行_华语_休闲_安静",
 "tagIds": "29_43_49_67",
 "id": 55302,
 "title": "华语乐坛优质女唱作人",
 "summary": "她们是游走在城市中的音乐使者；她们是女性音乐唱作人的代表；她们以独特的眼光与情怀创作歌曲。",
 "img": "http://wlanwm.12530.com:8080/musiclist/2014/0925/16/XjRz7udV.jpg",
 "url": "http://218.200.160.29/rdp2/v5.5/musicListInfo.do?groupcode\u003d365905/365925\u0026id\u003d55302",
 "playNum": 4651987,
 "keepNum": 0,
 "likeNum": 0,
 "musicNum": 12
 */

@interface SongMenuList : NSObject

@property (strong, nonatomic) Owner *owner;
@property (copy, nonatomic)   NSString *tagNames;
@property (copy, nonatomic)   NSString *title;
@property (copy, nonatomic)   NSString *summary;
@property (copy, nonatomic)   NSString *img;
@property (copy, nonatomic)   NSString *url;
@property (copy, nonatomic)   NSString *playNum;
@property (copy, nonatomic)   NSString *keepNum;
@property (copy, nonatomic)   NSString *likeNum;
@property (copy, nonatomic)   NSString *musicNum;

@end

/*
"userid": "804026c7-ab17-4d33-9fc7-ee2e03580c12",
"nickname": "神奇的小黄子",
"icon": "http://211.137.107.15:11001/sme/uniaccess?code\u003dMWQwMDEwMDBCWDBRcTdacTA2fDIwODUwMTI4MDg1ODE4%7C04352D9292C2C366AE997E68D0A78850D79BCC75D55782469C36A3093E132BCA\u0026fileID\u003d1d001000BX0Qq7Zq06",
"sex": "保密"
 */

@interface Owner : NSObject

@property (copy, nonatomic) NSString *userid;
@property (copy, nonatomic) NSString *nickname;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *sex;

@end
