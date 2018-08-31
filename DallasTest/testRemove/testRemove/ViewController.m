//
//  ViewController.m
//  testRemove
//
//  Created by xu zhao on 2018/8/1.
//  Copyright © 2018年 xu zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableDictionary *testDic = [NSMutableDictionary dictionary];
    [testDic removeObjectForKey:@"key"];
    NSMutableArray *testArray = [NSMutableArray array];
    [testArray removeObject:@"testArray"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
