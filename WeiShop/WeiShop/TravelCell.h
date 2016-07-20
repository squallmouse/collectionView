//
//  TravelCell.h
//  WeiShop
//
//  Created by 袁昊 on 16/7/19.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol testDelegate <NSObject>

- (void)testpp;

@end

@interface TravelCell : UICollectionViewCell

@property (nonatomic, assign)id <testDelegate>delegatePP;

@end
