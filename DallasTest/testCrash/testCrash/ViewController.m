//
//  ViewController.m
//  testCrash
//
//  Created by zhaoxu on 2018/1/25.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr=[[NSArray alloc] initWithObjects:@"1",@"2", nil];
    NSLog(@"%@",arr[2]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
