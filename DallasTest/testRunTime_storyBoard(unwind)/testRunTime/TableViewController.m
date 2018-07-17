//
//  TableViewController.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
}

- (IBAction)backMainView:(UIStoryboardSegue *)segue{
     NSLog(@"%s", __func__);
}

//yes 执行 unwindSegue 方法 NO 不执行 unwindSegue
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender{
     NSLog(@"%s", __func__);
    return YES;
}

@end
