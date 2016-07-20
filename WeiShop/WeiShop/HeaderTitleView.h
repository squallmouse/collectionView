//
//  HeaderTitleView.h
//  WeiShop
//
//  Created by 袁昊 on 16/7/20.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol HeaderTitleViewDelegate <NSObject>
//
//- (void)gotoSomeVC:(NSInteger)tag;
//
//@end

@interface HeaderTitleView : UICollectionReusableView

//@property (nonatomic, weak) id <HeaderTitleViewDelegate> headerDelegate;

@property (nonatomic, copy) void (^gotoVCWithTag)(NSInteger tag);

@end
