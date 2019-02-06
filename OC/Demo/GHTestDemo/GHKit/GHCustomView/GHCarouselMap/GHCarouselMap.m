//
//  GHCarouselMap.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHCarouselMap.h"
#import "GHLoadImagesHelper.h"
#import "GHCarouselMapItem.h"
#import "NSArray+GHAdd.h"

@interface GHCarouselMap()<UIScrollViewDelegate,UITableViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , assign) CGFloat preOffsetX;
@property (nonatomic , assign) NSInteger pageCount;
@property (nonatomic , strong) UIPageControl *pageControl;  // 分页控件

@end
@implementation GHCarouselMap


- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.preOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat leftEdgeOffsetX = 0;
    CGFloat rightEdgeOffsetX = self.frame.size.width * (self.pageCount + 1);
    
    if (scrollView.contentOffset.x < self.preOffsetX){
        // 左滑
        if (scrollView.contentOffset.x > leftEdgeOffsetX) {
            self.pageControl.currentPage = scrollView.contentOffset.x / self.frame.size.width - 1;
        }
        else if (scrollView.contentOffset.x == leftEdgeOffsetX) {
            self.pageControl.currentPage = self.pageCount - 1;
        }
        
        if (scrollView.contentOffset.x == leftEdgeOffsetX) {
            self.scrollView.contentOffset = CGPointMake(self.frame.size.width * _pageCount, 0);
        }
    } else {
        // 右滑
        // 设置小点
        if (scrollView.contentOffset.x < rightEdgeOffsetX) {
            self.pageControl.currentPage = scrollView.contentOffset.x / self.frame.size.width - 1;
        } else if (scrollView.contentOffset.x == rightEdgeOffsetX) {
            self.pageControl.currentPage = 0;
        }
        
        if (scrollView.contentOffset.x == rightEdgeOffsetX) {
            self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
        }
    }
}

- (void)setDataSource:(id<GHCarouselMapDataSource>)dataSource {
    _dataSource = dataSource;
}

- (void)setDalegate:(id<GHCarouselMapDelegate>)dalegate {
    _dalegate = dalegate;
}

- (void)clickControl: (UIControl *)control {
    
    if (self.dalegate && [self.dalegate respondsToSelector:@selector(carouselMap:didSelectRowAtIndex:)]) {
        [self.dalegate carouselMap:self didSelectRowAtIndex:self.pageControl.currentPage];
    }
    
}
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        self.pageCount = [self.dataSource countOfCellForCarouselMap:self];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * (self.pageCount + 2), CGRectGetHeight(self.frame));
        _scrollView.delegate = self;
        
        for (int i = 0; i < self.pageCount + 2; i++) {
            // 添加control,设置偏移位置
            UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height)];
            UIView *pageView = nil;
            if (i == 0) {
                pageView = [self.dataSource carouselMap:self cellAtIndex:self.pageCount - 1];
            } else if (i == _pageCount + 1){
                pageView = [self.dataSource carouselMap:self cellAtIndex:0];
            }else{
                pageView = [self.dataSource carouselMap:self cellAtIndex:i - 1];
            }
            pageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            
            [control addTarget:self action:@selector(clickControl:) forControlEvents:UIControlEventTouchUpInside];
            
            [control addSubview:pageView];
            
            [_scrollView addSubview:control];
        }
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        // 设置尺寸，坐标，注意纵坐标的起点
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 50, self.frame.size.width, 50)];
        // 设置页面数
        _pageControl.numberOfPages = _pageCount;
        // 设置当前页面索引
        _pageControl.currentPage = 0;
        // 设置未被选中时小圆点颜色
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        // 设置被选中时小圆点颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        // 设置能手动点小圆点条改变页数
        _pageControl.enabled = YES ;
        // 把导航条设置为半透明状态
        [_pageControl setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
        // 设置分页控制器的事件
        [_pageControl addTarget:self action:@selector(pageControlTouched) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

@end
