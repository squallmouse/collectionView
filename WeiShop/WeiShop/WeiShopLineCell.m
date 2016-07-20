//
//  WeiShopLineCell.m
//  WeiShop
//
//  Created by 袁昊 on 16/7/19.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import "WeiShopLineCell.h"

@implementation WeiShopLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
    self.backView.layer.borderWidth = 1;
    self.backView.layer.borderColor = [UIColor grayColor].CGColor;
}

@end
