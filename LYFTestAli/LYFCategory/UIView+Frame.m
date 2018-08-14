//
//  UIView+Frame.m
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - lyf_height
-(void)setLyf_height:(CGFloat)lyf_height {
    CGRect frame = self.frame;
    frame.size.height = lyf_height;
    self.frame = frame;
}

-(CGFloat)lyf_height {
    return self.frame.size.height;
}

#pragma mark - lyf_width
-(void)setLyf_width:(CGFloat)lyf_width {
    CGRect frame = self.frame;
    frame.size.width = lyf_width;
    self.frame = frame;
}

-(CGFloat)lyf_width {
    return  self.frame.size.width;
}

#pragma mark - lyf_x
-(void)setLyf_x:(CGFloat)lyf_x {
    CGRect frame = self.frame;
    frame.origin.x = lyf_x;
    self.frame = frame;
}

-(CGFloat)lyf_x {
    return self.frame.origin.x;
}

#pragma mark - lyf_y
-(void)setLyf_y:(CGFloat)lyf_y {
    CGRect frame = self.frame;
    frame.origin.y = lyf_y;
    self.frame = frame;
}

-(CGFloat)lyf_y {
    return self.frame.origin.y;
}

@end
