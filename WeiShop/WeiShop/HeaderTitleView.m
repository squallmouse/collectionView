//
//  HeaderTitleView.m
//  WeiShop
//
//  Created by 袁昊 on 16/7/20.
//  Copyright © 2016年 squallmouse. All rights reserved.
//

#import "HeaderTitleView.h"

@implementation HeaderTitleView

-(void)tap:(UITapGestureRecognizer*)tap
{
    if (self.gotoVCWithTag) {
        NSLog(@"轻触 tag = %ld",tap.view.tag);
        self.gotoVCWithTag(tap.view.tag);
    }

//
//    if (self.headerDelegate) {
//        NSLog(@"轻触 tag = %ld",tap.view.tag);
//        [self.headerDelegate gotoSomeVC:tap.view.tag];
//    }

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userInteractionEnabled = YES;
// 手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;//点击几次 2就是双击
    tap.numberOfTouchesRequired = 1;//几个手指按
    [self addGestureRecognizer:tap];
//    

}

@end
