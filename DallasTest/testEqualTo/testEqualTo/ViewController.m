//
//  ViewController.m
//  testEqualTo
//
//  Created by zhaoxu on 2017/9/3.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "testDTO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    testDTO *test1 = [[testDTO alloc]init];
    test1.code = @"1";
    test1.name = @"1";
    
    testDTO *test2 = [[testDTO alloc]init];
    test2.code = @"2";
    test2.name = @"2";
    
    testDTO *test3 = [[testDTO alloc]init];
    test3.code = @"3";
    test3.name = @"3";
    
    testDTO *test4 = [[testDTO alloc]init];
    test4.code = @"4";
    test4.name = @"4";
    
    testDTO *containTEst = [[testDTO alloc]init];
    containTEst.code = @"4";
    containTEst.name = @"containTEst";
    
    NSArray *dtoArray = @[test1, test2, test3, test4];
    
    BOOL isEqual = [dtoArray containsObject:containTEst];
    
    NSLog(@"========= %i ========", isEqual);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
