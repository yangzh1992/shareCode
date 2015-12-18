//
//  ZHRootViewController.m
//  shareCode
//
//  Created by qianfeng on 15/12/17.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import "ZHRootViewController.h"
#import "UIView+Extension.h"
#import "ZHViewController01.h"
#import "ZHViewController02.h"
#import "ZHViewController03.h"
#import "ZHViewController04.h"
#import "ZHPageSlider.h"
@interface ZHRootViewController ()<ZHPageSliderDelegate,UIScrollViewDelegate>

@end

@implementation ZHRootViewController
{
    ZHPageSlider *_pageSlider;
    UIScrollView *_scrollView;
    CGFloat _originX;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView = scrollView;
    _scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.height);
    [self.view addSubview:scrollView];
    
    for (int i = 1; i < 5; i++) {
        NSString *className = [NSString stringWithFormat:@"ZHViewController0%d",i];
        Class clazz = NSClassFromString(className);
        UIViewController *viewC = [[clazz alloc]init];
//        viewC.view.width = 200;
        [self addChildViewController:viewC];
        //设置view的frame 并且加入视图
        viewC.view.backgroundColor = ZHRColor;
        viewC.view.x = self.view.width * (i - 1);
        [scrollView addSubview:viewC.view];
    }
    
    ZHPageSlider *pageControl = [ZHPageSlider pageSlider];
    pageControl.y = 100;
    _pageSlider = pageControl;
    _pageSlider.pageDelegate = self;
    pageControl.pageNumber = 4;
    pageControl.titleArray = @[@"button的自定义",@"无限滚动1",@"无限滚动2",@"无限滚动3"];

    [self.view addSubview:pageControl];
    _originX = _pageSlider.rollLable.centerX;
    
}

#pragma mark ZHPageSlider的代理
- (void)ZHPageSliderTitleButtonDidClicked:(ZHPageSlider *)pageSlider atIndex:(NSUInteger)index WithButton:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        pageSlider.currentIndex = index;
        
        _scrollView.contentOffset = CGPointMake(_scrollView.width * index, self.view.y);
    }];
    
}

#pragma mark  UIScrollView 的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
       //设置_pageSlider的位置,并且记录自己的currentIndex
        _pageSlider.rollLable.centerX =  _originX + (double)_scrollView.contentOffset.x / _scrollView.width * _pageSlider.magin + 35;
        
//        void (^block)() = ^{
//            [UIView animateWithDuration:0.5 animations:^{
//                _pageSlider.contentOffset = CGPointMake((_pageSlider.contentSize.width - _scrollView.width) * (_scrollView.contentOffset.x / (_scrollView.contentSize.width - _scrollView.width)) , _pageSlider.contentOffset.y);
//            }];
//        };
        [self performSelector:@selector(move) withObject:nil afterDelay:0.5];

        

        
       
        
    }
}

- (void)move
{
    [UIView animateWithDuration:0.5 animations:^{
        _pageSlider.contentOffset = CGPointMake((_pageSlider.contentSize.width - _scrollView.width) * (_scrollView.contentOffset.x / (_scrollView.contentSize.width - _scrollView.width)) , _pageSlider.contentOffset.y);
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        _pageSlider.currentIndex = scrollView.contentOffset.x / _scrollView.width;
    }
}

@end
