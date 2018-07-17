//
//  ViewController.m
//  testNaviPop
//
//  Created by zhaoxu on 2017/6/13.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏navigaTion Bar
    self.fd_prefersNavigationBarHidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
