//
//  ViewController.m
//  project(OC)
//
//  Created by zhaoxu on 2017/9/19.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
