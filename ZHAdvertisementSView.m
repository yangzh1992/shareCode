//
//  ZHAdvertisementSView.m
//  02-广告视图
//
//  Created by qianfeng on 15/12/15.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "ZHAdvertisementSView.h"

@implementation ZHAdvertisementSView
{
    UIPageControl *_pageControl;
    NSTimer *_timer;
    UIView *_newSuperview;
}
+ (instancetype)advertisementScrollVeiw
{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置宽高
        self.frame = CGRectMake(0, 0, 375, 400);
//        self.backgroundColor = [UIColor yellowColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        //加入pageControl
        UIPageControl * pageControl = [[UIPageControl alloc] init];
        _pageControl = pageControl;
        pageControl.frame = CGRectMake(40, 130, 300, 20);
        pageControl.numberOfPages = 3;//默认总的页数
        //当前页指标颜色
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        //其他页指示标颜色
        pageControl.pageIndicatorTintColor = [UIColor greenColor];
        self.addTimer = YES;
    }
    return self;
}

- (void)layoutSubviews
{
//    CGFloat viewW = self.bounds.size.width;
//    CGFloat pCW = _pageControl.bounds.size.width;
//   _pageControl.frame = CGRectMake((viewW - pCW) / 2 , <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    _newSuperview = newSuperview;
}

-(void)didMoveToSuperview
{
     //把pageControl拿上来
    [_newSuperview addSubview:_pageControl];
}

- (void)addImages :(NSArray *)imageNames
{
    for(int i= 0; i < imageNames.count;i++)
    {
        UIImageView * imageView = [[UIImageView alloc] init];
        //        NSLog(@"%@",name);
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        //Frame
        CGFloat imageViewX = i * self.frame.size.width;
        CGFloat imageViewY = 0;
        CGFloat imageViewH = self.frame.size.height;
        CGFloat imageViewW = self.frame.size.width;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    }
    self.contentSize = CGSizeMake(imageNames.count * self.frame.size.width , 0);
    _pageControl.numberOfPages = imageNames.count;
    
    if (self.isAddTimer) {
        [self startTimer];
        
    }
    
}


- (void)startTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    _timer = timer;
    
    //把timer对象,加入到一个可以通讯的事件循环中去
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark UIScrollViewDelegate

- (void)autoScroll
{
    
    //获得当前停留在的页数
    //如果已经是最后一页,那么从第0也重新开始计算

    NSInteger page = (_pageControl.currentPage >= _pageControl.numberOfPages - 1) ? 0:( _pageControl.currentPage +1);
    //通过人为设置contentOffset的x偏移量,达到滚动效果
    [self setContentOffset:CGPointMake(self.frame.size.width * page , 0) animated:YES];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //根据偏移量的变化,计算当前停留的页数
    
        int currentPage =  (scrollView.contentOffset.x +  scrollView.frame.size.width * 0.5)/ scrollView.frame.size.width;
        _pageControl.currentPage = currentPage;
//    NSLog(@"_pageControl.currentPage %lu",currentPage);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //1.取消time
    [_timer invalidate]; //一旦调用了invalidate就相当于杀掉了当前timer,不能够重新的再次启动
    _timer = nil;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //1.开始新的time调用
    if (self.isAddTimer) {
        [self startTimer];
    }
    
}


@end
