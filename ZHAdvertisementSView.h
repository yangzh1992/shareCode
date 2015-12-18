//
//  ZHAdvertisementSView.h
//  02-广告视图
//
//  Created by qianfeng on 15/12/15.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHAdvertisementSView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,assign,getter=isAddTimer)BOOL addTimer;
//@property (nonatomic,strong)UIPageControl *pageControl;
+ (instancetype)advertisementScrollVeiw;
- (void)addImages :(NSArray *)imageNames;
@end
