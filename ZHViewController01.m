//
//  ZHViewController01.m
//  shareCode
//
//  Created by qianfeng on 15/12/17.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import "ZHViewController01.h"
#import "ZHAdvertisementSView.h"
#import "UIView+Extension.h"
#import "ZHButton.h"
@interface ZHViewController01 ()

@end

@implementation ZHViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHButton *button = [ZHButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"首页" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor whiteColor];
    button.width = 100;
    button.height = 50;
    button.x = 100;
    button.y = 300;
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [button2 setTitle:@"首页" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.width = 100;
    button2.height = 50;
    button2.x = 100;
    button2.y = 400;
    [self.view addSubview:button2];
    //打开展示一下他们的内部结构
    button.titleLabel.backgroundColor = [UIColor redColor];
    button.imageView.backgroundColor = [UIColor blueColor];
    
    button2.titleLabel.backgroundColor = [UIColor redColor];
    button2.imageView.backgroundColor = [UIColor blueColor];
 
    
}
//直接取出title中的图片
- (void)titleClick :(UIButton *)btn
{
    btn.imageView.transform = CGAffineTransformRotate(btn.imageView.transform, M_PI);
}

@end
