//
//  ZHPageSlider.h
//  shareCode
//
//  Created by qianfeng on 15/12/17.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHPageSlider;
@protocol ZHPageSliderDelegate <NSObject>
@optional
- (void)ZHPageSliderTitleButtonDidClicked:(ZHPageSlider *)pageSlider atIndex:(NSUInteger)index WithButton:(UIButton *)button;
@end

@interface ZHPageSlider : UIScrollView
@property(nonatomic,assign)NSUInteger pageNumber;
@property(nonatomic,assign)NSUInteger currentIndex;
@property(nonatomic,strong)UILabel *rollLable;
/**
 *  两个button之间的间距
 */
@property(nonatomic,assign)CGFloat magin;

/**
 *  标题的数组
 */
@property (nonatomic ,copy) NSArray *titleArray;
@property (nonatomic,weak) id<ZHPageSliderDelegate> pageDelegate;

+(instancetype)pageSlider;
+(instancetype)pageSliderWithFrame:(CGRect)frame;
@end
