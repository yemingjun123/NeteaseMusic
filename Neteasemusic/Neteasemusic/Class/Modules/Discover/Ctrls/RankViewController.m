//
//  RankViewController.m
//  Neteasemusic
//
//  Created by 叶明君 on 16/12/22.
//  Copyright © 2016年 叶明君. All rights reserved.
//

#import "RankViewController.h"
#import "UserListCell.h"
#import "OfficialListCell.h"
#define user_spaceW 10

@interface RankViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RankViewController

static NSString *userlist_id = @"userlist_id";
static NSString *officialist_id = @"officialist_id";

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"UserListCell" bundle:nil] forCellWithReuseIdentifier:userlist_id];
    [self.collectionView registerNib:[UINib nibWithNibName:@"OfficialListCell" bundle:nil] forCellWithReuseIdentifier:officialist_id];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
//UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OfficialListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:officialist_id forIndexPath:indexPath];
        return cell;
    } else {
        UserListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:userlist_id forIndexPath:indexPath];
        return cell;
    }
}

//UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(self.view.ymj_w, 123);
    }
    CGFloat itemW = (self.view.ymj_w - 4 * user_spaceW) / 3;
    return CGSizeMake(itemW, itemW + 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    if (section == 0) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsMake(0, user_spaceW, 0, user_spaceW);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.ymj_w, 45);
}

@end
