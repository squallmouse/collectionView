//
//  WeiShopLineCell.h
//  WeiShop
//
//  Created by 袁昊 on 16/7/19.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiShopLineCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightDistanct;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftDistanct;

@end
