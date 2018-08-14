//
//  LYFButton.h
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LYFButtonType) {
    /// 扫一扫
    LYFButtonTypeScan = 0,
    /// 付钱
    LYFButtonTypePay,
    /// 收钱
    LYFButtonTypeCollect,
    /// 手机
    LYFButtonTypePhone
};

@interface LYFButton : UIButton

/// 初始化方法
-(instancetype)initWithFrame:(CGRect)frame type:(LYFButtonType)type;

@end
