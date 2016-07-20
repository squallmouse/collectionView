//
//  WeiShopHeadView.h
//  WeiShop
//
//  Created by 袁昊 on 16/7/19.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeiShopHeadViewDelegate <NSObject>

- (void)test;

@end

@interface WeiShopHeadView : UICollectionReusableView

@property (nonatomic, assign)id <WeiShopHeadViewDelegate> delegateTest;

@end
