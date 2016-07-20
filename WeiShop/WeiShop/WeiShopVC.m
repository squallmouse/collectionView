//
//  WeiShopVC.m
//  WeiShop
//
//  Created by 袁昊 on 16/7/19.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import "WeiShopVC.h"

#import "ChooseProductCell.h"
#import "WeiShopHeadView.h"
#import "HeaderTitleView.h"

#import "TravelCell.h"
#import "HighQualityGoodsCell.h"
#import "WeiShopLineCell.h"



UIKIT_EXTERN NSString *const UICollectionElementKindSectionHeader;
// NSString *HeaderTitleViewKind = @"HeaderTitleViewKind";
//

@interface WeiShopVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,WeiShopHeadViewDelegate,testDelegate>
//,HeaderTitleViewDelegate>

@property (nonatomic, strong) WeiShopHeadView *shop;
@property (nonatomic, strong) UICollectionView *mcollection;

@end

@implementation WeiShopVC



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
//
    self.automaticallyAdjustsScrollViewInsets = NO;
self.shop = [[WeiShopHeadView alloc]init];
//  滑动方向速直
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//  通过一个布局策略layout 来创建
    self.mcollection = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];

//  选择产品的cell
    [self.mcollection registerNib:[UINib nibWithNibName:@"ChooseProductCell" bundle:nil] forCellWithReuseIdentifier:@"ChooseProductCellIden"];
//  头部视图
    [self.mcollection registerNib:[UINib nibWithNibName:@"WeiShopHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WeiShopHeadViewIden"];
//  线路头部视图
    [self.mcollection registerNib:[UINib nibWithNibName:@"HeaderTitleView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderTitleViewIden"];
//  旅游线路 cell
    [self.mcollection registerNib:[UINib nibWithNibName:@"TravelCell" bundle:nil] forCellWithReuseIdentifier:@"TravelCellIden"];
//   精品线路 cell
    [self.mcollection registerNib:[UINib nibWithNibName:@"HighQualityGoodsCell" bundle:nil] forCellWithReuseIdentifier:@"HighQualityGoodsCellIden"];
//    cell
    [self.mcollection registerNib:[UINib nibWithNibName:@"WeiShopLineCell" bundle:nil] forCellWithReuseIdentifier:@"WeiShopLineCellIden"];

//
    self.mcollection.delegate = self;
    self.mcollection.dataSource = self;
    self.mcollection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mcollection];

}

#pragma mark - 布局


// section 头部的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 290);
    }else{
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
    }
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
//  section 0 的view
        WeiShopHeadView *headreusableView = nil;
        if (kind == UICollectionElementKindSectionHeader) {
          WeiShopHeadView * headreusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"WeiShopHeadViewIden" forIndexPath:indexPath];
            ((WeiShopHeadView*)headreusableView).delegateTest = self;
    //        headreusableView.frame = CGRectZero;
            headreusableView.backgroundColor = [UIColor greenColor];

        }
        return  (UICollectionReusableView*)headreusableView;
//        return  self.shop;

    }else{
//其它的 view
//        HeaderTitleView *headerTitleReusableView = nil;
//        if (kind == UICollectionElementKindSectionHeader ) {
           HeaderTitleView * headerTitleReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderTitleViewIden" forIndexPath:indexPath];
//            headerTitleReusableView.backgroundColor = [UIColor yellowColor];
            headerTitleReusableView.userInteractionEnabled = YES;
            headerTitleReusableView.tag = 18000 + indexPath.section;

//          __weak  WeiShopVC *weakSelf = self;
            if (headerTitleReusableView != nil) {
//                headerTitleReusableView.gotoVCWithTag = ^(NSInteger tag){
//                    NSLog(@"view.tag = %ld",tag);
//                };
            }

//            headerTitleReusableView.headerDelegate = self;
            return headerTitleReusableView;
//        }

    }
    return nil;
}


// section 之间的距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    if (section < 3) {
//        return UIEdgeInsetsMake(0, 0, 15, 0);
//    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
//    }

}

// row 上下之间的 之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//  Item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 60);
    }else if (indexPath.section == 1){
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    }else if (indexPath.section == 2){
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 160);
    }else{
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/2, 270);
    }

}

#pragma mark - CollectionView

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 3;
    }else{
        return 1;
    }
}
//分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        ChooseProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChooseProductCellIden" forIndexPath:indexPath];


        return cell;

    }else if (indexPath.section == 1){
        TravelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TravelCellIden" forIndexPath:indexPath];
        cell.delegatePP = self;
        return cell;

    }else if (indexPath.section == 2){
        HighQualityGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HighQualityGoodsCellIden" forIndexPath:indexPath];

        return cell;

    }else{
        WeiShopLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeiShopLineCellIden" forIndexPath:indexPath];

        if (indexPath.row %2 == 0) {
            cell.leftDistanct.constant = 15;
            cell.rightDistanct.constant = 5;
        }else{
            cell.leftDistanct.constant = 5;
            cell.rightDistanct.constant = 15;
        }

        return cell;
        
    }

}

#pragma mark - 一些事件

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"section = %ld , row = %ld",(long)indexPath.section,(long)indexPath.row);

}

- (void)gotoSomeVC:(NSInteger)tag{
    NSLog(@"------");
}

#pragma mark - Other

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
