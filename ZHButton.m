//
//  ZHButton.m
//  微博
//
//  Created by qianfeng on 15/11/25.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import "ZHButton.h"
#import "UIView+Extension.h"
@implementation ZHButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];

        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}


//设置内部文字的frame  
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

//设置内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imgX = self.titleLabel.width;
    CGFloat imgY = 0;
    CGFloat imgH = self.height;
    CGFloat imgW = self.height;
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}
@end
