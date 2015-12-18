//
//  ZHViewController02.m
//  shareCode
//
//  Created by qianfeng on 15/12/17.
//  Copyright (c) 2015年 叶无道. All rights reserved.
//

#import "ZHViewController02.h"
#import "ZHAdvertisementSView.h"
#import "UIView+Extension.h"
@interface ZHViewController02 ()

@end

@implementation ZHViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHAdvertisementSView *sv = [ZHAdvertisementSView advertisementScrollVeiw];
    sv.addTimer = NO;
    [sv addImages:@[@"1.jpg",@"2.jpg",@"3.jpg"]];
    sv.y = 200;
    [self.view addSubview:sv];
}

@end
