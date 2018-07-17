//
//  ViewController.m
//  tesrArc4Random
//
//  Created by zhaoxu on 2017/7/12.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSInteger randomIndex = arc4random() % 0;
}


@end
