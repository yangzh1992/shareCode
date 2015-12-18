//
//  ZHViewController04.m
//  shareCode
//
//  Created by qianfeng on 15/12/17.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import "ZHViewController04.h"
#import "ZHAdvertisementSView.h"
#import "UIView+Extension.h"
@interface ZHViewController04 ()

@end

@implementation ZHViewController04

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHAdvertisementSView *sv = [ZHAdvertisementSView advertisementScrollVeiw];
    //将你的数据源复制50份
    //1.
    NSArray *array = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    for (int i = 0; i < 100; i++) {
       array = [array arrayByAddingObjectsFromArray:@[@"1.jpg",@"2.jpg",@"3.jpg"]];
    }
    [sv addImages:array];
    //2.将数据源移动到中间部分
    sv.contentOffset = CGPointMake(sv.contentSize.width * .5, sv.contentOffset.y);
    
    sv.y = 200;
    [self.view addSubview:sv];
}


@end
