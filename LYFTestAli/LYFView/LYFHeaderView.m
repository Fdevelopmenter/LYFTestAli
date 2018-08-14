//
//  LYFHeaderView.m
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import "LYFHeaderView.h"
#import "LYFButton.h"

@implementation LYFHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
        
        CGFloat x = 0;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        for (int index = 0; index < 4; index++) {
            LYFButton *button = [[LYFButton alloc] initWithFrame:CGRectMake(x, 0, screenWidth / 4, frame.size.height) type:index];
            
            [self addSubview:button];
            
            x = x + screenWidth / 4;
        }
    }
    
    return self;
}

#pragma mark - Set方法
-(void)setContentOffsetY:(CGFloat)contentOffsetY {
    _contentOffsetY = contentOffsetY;
    
    CGFloat alpha = 0;
    if (contentOffsetY > 70) {
        alpha = 0;
    } else if (contentOffsetY > 20) {
        alpha = (70 - contentOffsetY) / 50;
    } else {
        alpha = 1;
    }
    
    for (UIView *subview in self.subviews) {
        subview.alpha = alpha;
    }
}

@end
