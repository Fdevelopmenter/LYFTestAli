//
//  LYFScrollView.h
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LYFScrollViewContentOffsetAction)(CGFloat contentOffsetY);

@interface LYFScrollView : UIScrollView

/// 偏移事件
@property (nonatomic, copy) LYFScrollViewContentOffsetAction contentOffsetAction;

@end
