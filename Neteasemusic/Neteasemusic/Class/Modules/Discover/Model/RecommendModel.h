//
//  RecommendModel.h
//  Neteasemusic
//
//  Created by 叶明君 on 17/1/6.
//  Copyright © 2017年 叶明君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RankModel.h"
@class RecommendGroupModel,RecommendCmModel,BannerModel;

@interface RecommendModel : NSObject

@property (copy, nonatomic)   NSString *publishTime;
@property (strong, nonatomic) NSArray <RecommendGroupModel *>*groups;

@end

/*
 "title": "音乐之声",
 "type": 10,
 "sort": 2,
 "hotSpots": [
 {
 "type": 1,
 "title": "信 数字专辑《大爷门》",
 "img": "http://wlanwm.12530.com/newcms/quku/17/01/03/17010313543224_720x720_2271.jpg",
 "summary": "前门后门，摇滚爷门",
 "url": "http://218.200.160.29/rdp2/v5.4/template/11775801/activityinfo_ios.do?groupcode=365905/365911/4557177/16673414&albumId=1104709639",
 "groupcode": "365905/365911/4557177/16673414",
 "sourceId": "16673414",
 "shareUrl": "http://a.vip.migu.cn/rdp2/v5.5/share/share_activityinfo.do?groupcode=365905/365911/4557177/16673414&templateid=11775801"
 }
 ]
 */

@interface RecommendGroupModel : NSObject

@property (copy, nonatomic)   NSString *title;
@property (copy, nonatomic)   NSString *type;
@property (copy, nonatomic)   NSString *sort;
@property (strong, nonatomic) NSArray <BannerModel *>*banners;
//@property (strong, nonatomic) NSArray <RecommendCmModel *>*items;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*hotSpots;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*recommends;
@property (strong, nonatomic) NSArray <RankSongsModel *>*songs;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*firsts;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*topics;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*radios;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*activities;
@property (strong, nonatomic) NSArray <RecommendCmModel *>*miguColumns;

@end

/*
 "type": 1,
 "title": "信 数字专辑《大爷门》",
 "img": "http://wlanwm.12530.com/newcms/quku/17/01/03/17010313543224_720x720_2271.jpg",
 "summary": "前门后门，摇滚爷门",
 "url": "http://218.200.160.29/rdp2/v5.4/template/11775801/activityinfo_ios.do?groupcode=365905/365911/4557177/16673414&albumId=1104709639",
 "groupcode": "365905/365911/4557177/16673414",
 "sourceId": "16673414",
 "shareUrl": "http://a.vip.migu.cn/rdp2/v5.5/share/share_activityinfo.do?groupcode=365905/365911/4557177/16673414&templateid=11775801"
 */

//@interface HotspotModel : NSObject
//
//@property (copy, nonatomic) NSString *title;
//@property (copy, nonatomic) NSString *type;
//@property (copy, nonatomic) NSString *img;
//@property (copy, nonatomic) NSString *url;
//@property (copy, nonatomic) NSString *shareUrl;
//@property (copy, nonatomic) NSString *summary;
//
//@end

/*
 "type": 2,
 "title": "猜你喜欢",
 "contentid": "430570",
 "summary": "根据收听习惯为您量身定制",
 "img": "http://wlanwm.12530.com/newcms/quku/16/12/355/161220140755381_500x500_1165.jpg",
 "url": "http://218.200.160.29/rdp2/v5.5/related_songs.do?groupcode=365905/365911/365942/430570",
 "playNums": 0
 */


@interface RecommendCmModel : NSObject

@property (copy, nonatomic)   NSString *title;
@property (copy, nonatomic)   NSString *type;
@property (copy, nonatomic)   NSString *img;
@property (copy, nonatomic)   NSString *url;
@property (copy, nonatomic)   NSString *contentid;
@property (copy, nonatomic)   NSString *summary;
@property (copy, nonatomic)   NSString *shareUrl;
@property (assign, nonatomic) NSInteger playNums;

@end


/*
 "title": "【首发】《孤芳不自赏》原声为爱绽放，唯美来袭",
 "type": 5,
 "img": "http://wlanwm.12530.com/newcms/quku/17/01/06/170106155039230_720x300_7685.jpg",
 "url": "http://218.200.160.29/rdp2/v5.5/musicListInfo.do?id\u003d1544683\u0026groupcode\u003d365905/365911/365935",
 "groupcode": "365905/365911/365935",
 "sourceId": "1544683",
 "tagName": "新歌",
 "tagPicUrl": "http://wlanwm.12530.com/newcms/quku/15/04/113/150423173416529_86x34_5805.png"
 */

@interface BannerModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *groupcode;
@property (copy, nonatomic) NSString *tagPicUrl;


@end
