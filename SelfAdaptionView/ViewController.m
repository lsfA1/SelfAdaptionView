//
//  ViewController.m
//  SelfAdaptionView
//
//  Created by 李少锋 on 2018/11/21.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import "ViewController.h"
#import "SelfAdaptionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *Selearr = @[@"这是文本",@"这是文本这是文本",@"这是文本这是文本这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本",@"这是文本"];
    SelfAdaptionView *adView=[[SelfAdaptionView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 0)];
    [self.view addSubview:adView];
    [adView createView:Selearr andBlock:^(NSString * _Nonnull itemName) {
        NSLog(@"点击:%@",itemName);
    }];
}

@end
