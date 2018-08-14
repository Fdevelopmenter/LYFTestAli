//
//  LYFButton.m
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import "LYFButton.h"
#import "UIView+Frame.h"

@implementation LYFButton

-(instancetype)initWithFrame:(CGRect)frame type:(LYFButtonType)type {
    if (self = [super initWithFrame:frame]) {

        self.imageEdgeInsets = UIEdgeInsetsMake(10, 31, 45, 31);
        self.titleEdgeInsets = UIEdgeInsetsMake(55, -100, 0, 0);
        switch (type) {
            case LYFButtonTypeScan: {
                [self setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
                [self setTitle:@"扫一扫" forState:UIControlStateNormal];
                break;
            }
            case LYFButtonTypePay: {
                [self setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
                [self setTitle:@"付钱" forState:UIControlStateNormal];
                break;
            }
            case LYFButtonTypeCollect: {
                [self setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
                [self setTitle:@"收钱" forState:UIControlStateNormal];
                break;
            }
            case LYFButtonTypePhone: {
                [self setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
                [self setTitle:@"手机" forState:UIControlStateNormal];
                break;
            }
            default:
                break;
        }
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.lyf_height = 20;
    }
    
    return self;
}

@end
