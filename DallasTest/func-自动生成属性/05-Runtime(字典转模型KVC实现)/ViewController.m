//
//  ViewController.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+Property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 解析Plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Directions" ofType:@"geojson"];
    
//    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
     // 设计模型属性代码
    [NSObject createPropertyCodeWithDict:dict];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
