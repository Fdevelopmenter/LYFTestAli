//
//  LYFNavigationView.m
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import "LYFNavigationView.h"

@implementation LYFNavigationView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat x = 0;
        CGFloat width = 40.f;
        for (NSInteger index = 0; index < 3; index ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (index == 0) {
                [button setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
            } else if (index == 1) {
                [button setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
            } else if (index == 2) {
                [button setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
            }
            
            button.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
            button.frame = CGRectMake(x, 0, width, width);
            [self addSubview:button];
            
            x = x + width;
        }
    }
    
    return self;
}

@end
