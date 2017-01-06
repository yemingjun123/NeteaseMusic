//
//  RankModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/4.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GroupsModel,RanksModel,RankSongsModel;

@interface RankModel : NSObject

@property (strong, nonatomic) NSArray<GroupsModel *> *groups;

@end

@interface GroupsModel : NSObject

@property (strong, nonatomic) NSArray<RanksModel *> *ranks;
@property (copy, nonatomic) NSString *tag;

@end

/*
 "preRanks": [],
 "pagecount": 2,
 "totalcount": 50,
 "groupcode": "365905/365918/469202/469231",
 "publishTime": "2017-01-04 13:53:55",
 "shareLink": "http://music.migu.cn/m/v1/rank_list.html?groupcode\u003d365905/365918/469202/469231\u0026ua\u003dIphone_Sst\u0026rankId\u003d469231\u0026version\u003d4.30903",
 "shareTitle": "咪咕音乐榜",
 "summary": "每日新歌抢先听！！",
 "img": "http://wlanwm.12530.com/newcms/quku/15/11/320/151116093348744_688x240_4439.png",
 "icon": "http://wlanwm.12530.com/newcms/quku/15/11/320/151116093216360_86x88_3660.png",
 */

@interface RanksModel : NSObject

@property (strong, nonatomic) NSArray<RankSongsModel *> *rankSongs;
@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *shareLink;
@property (copy, nonatomic) NSString *shareTitle;
@property (copy, nonatomic) NSString *publishTime;

@end

/*
 "title": "告白气球",
 "singer": "周杰伦",
 "album": "周杰伦的床边故事",
 "singerid": "112",
 "albumid": "1003767159",
 "contentid": "60054704037",
 "control": "11110",
 "groupcode": "365905/365918/469202/471150",
 "isring_cid": "",
 "isring_sid": "",
 "singerIcon": "http://wlanwm.12530.com:8080/newcms/cms/2016/1222/1440/ARTS1612221433233790.jpg",
 "singerImg": "http://wlanwm.12530.com:8080/newcms/cms/2016/1222/1440/ARTL1612221433233790.jpg",
 "albumType": "0",
 "albumIcon": "http://wlanwm.12530.com:8080/newcms/cms/2016/0725/1740/AS1606241532331362.jpg",
 "albumImg": "http://wlanwm.12530.com:8080/newcms/cms/2016/0725/1740/AL1606241532331362.jpg",
 "url": "http://218.200.160.29/rdp2/v5.5/sub/listen.do?contentid\u003d60054704037",
 "toneControl": "1111",
 "hqFlag": 1
 */

@interface RankSongsModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *singerid;
@property (copy, nonatomic) NSString *singer;
@property (copy, nonatomic) NSString *album;
@property (copy, nonatomic) NSString *toneControl;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *singerIcon;

//在列表中的编号
@property (assign, nonatomic) NSInteger number;
@property (strong, nonatomic) UIColor *numberColor;

@end
