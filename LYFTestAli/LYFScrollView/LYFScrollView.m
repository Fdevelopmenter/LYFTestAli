//
//  LYFScrollView.m
//  LYFTestAli
//
//  Created by 李玉枫 on 2018/8/14.
//  Copyright © 2018年 李玉枫. All rights reserved.
//

#import "LYFScrollView.h"
#import "LYFHeaderView.h"
#import "LYFTableView.h"
#import "MJRefresh.h"
#import "UIView+Frame.h"

#define kHeaderHeight 100.f

@interface LYFScrollView() <UIScrollViewDelegate>

/// 列表
@property (nonatomic, strong) LYFTableView *tableView;
/// 列表头部
@property (nonatomic, strong) LYFHeaderView *headerView;

@end

@implementation LYFScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        
        [self headerView];
        
        // 设定行数
        self.tableView.rowNumber = 20;
        // tableViewCell的高度是50
        self.contentSize = CGSizeMake(0, kHeaderHeight + self.tableView.rowNumber * 50.f);

        __weak __typeof(self)weakSelf = self;
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
    }
    
    return self;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    if (contentOffsetY < -kHeaderHeight / 2) {
        [self.tableView.mj_header beginRefreshing];
    } else if (contentOffsetY > 0 && contentOffsetY < kHeaderHeight / 2) {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    } else if (contentOffsetY > kHeaderHeight / 2 && contentOffsetY < kHeaderHeight) {
        [self setContentOffset:CGPointMake(0, kHeaderHeight) animated:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 偏移量
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    if (self.contentOffsetAction) {
        self.contentOffsetAction(contentOffsetY);
    }
    
    if (contentOffsetY <= 0) {
        // 当偏移量小于0时，头部视图的Y值跟随偏移量上移
        self.headerView.lyf_y = contentOffsetY;
        // tableView的Y值也是保持不变
        self.tableView.lyf_y = contentOffsetY + kHeaderHeight;
        
        // 当tableView没有刷新时，tableView的contentOffset发生改变
        if (![self.tableView.mj_header isRefreshing]) {
            self.tableView.contentOffset = CGPointMake(0, contentOffsetY);
        }
    } else {
        // 头部视图滚动差的效果
        self.headerView.lyf_y = contentOffsetY/2;
    }
    
    self.headerView.contentOffsetY = contentOffsetY;
}

#pragma mark - 网络请求
- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - Get方法
-(LYFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[LYFTableView alloc] initWithFrame:CGRectMake(0, kHeaderHeight, self.lyf_width, self.lyf_height) style:UITableViewStylePlain];
        // 禁止tableView滑动
        _tableView.scrollEnabled = NO;
        
        [self addSubview:_tableView];
    }
    
    return _tableView;
}

-(LYFHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[LYFHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.lyf_width, kHeaderHeight)];
        
        [self addSubview:_headerView];
    }
    
    return _headerView;
}

@end
