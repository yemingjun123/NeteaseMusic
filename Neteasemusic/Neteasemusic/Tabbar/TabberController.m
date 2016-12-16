//
//  TabberController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/16.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "TabberController.h"
#import "DiscoverViewController.h"
#import "MyMusicViewController.h"
#import "FriendViewController.h"
#import "AccountViewController.h"

@interface TabberController ()

@end

UINavigationController *createNv(UIViewController *vc, NSString *imageName, NSString *selectImageName) {
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:
        UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:
        UIImageRenderingModeAlwaysOriginal];
    nv.tabBarItem = [[UITabBarItem alloc]initWithTitle:vc.tabBarItem.title
        image:image selectedImage:selectImage];
    return nv;
};


@implementation TabberController

+ (instancetype)singleton {
    static TabberController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TabberController alloc]init];
    });
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    discover.tabBarItem.title = @"发现音乐";
    
    MyMusicViewController *myMusic = [[MyMusicViewController alloc]init];
    myMusic.title = @"我的音乐";
    
    FriendViewController *friend = [[FriendViewController alloc]init];
    friend.tabBarItem.title = @"朋友";
    
    AccountViewController *account = [[AccountViewController alloc]init];
    account.title = @"账号";
    
    self.viewControllers = @[
                             createNv(discover, @"cm2_btm_icn_discovery.png", @"cm2_btm_icn_discovery_prs.png"),
                             createNv(myMusic, @"cm2_btm_icn_music.png", @"cm2_btm_icn_music_prs.png"),
                             createNv(friend, @"cm2_btm_icn_friend.png", @"cm2_btm_icn_friend_prs.png"),
                             createNv(account, @"cm2_btm_icn_account.png", @"cm2_btm_icn_account_prs.png")
                             ];
    
    self.tabBar.tintColor = UIColorFromRGB(WitheColor);
    
    UIImage *bgImage = [UIImage imageNamed:@"cm2_btm_tab_right.png"];
    
//    [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(bgImage.size.height / 2, bgImage.size.width /2 - 1 , bgImage.size.height / 2, bgImage.size.width / 2) resizingMode:UIImageResizingModeStretch];
    self.tabBar.backgroundImage = bgImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
