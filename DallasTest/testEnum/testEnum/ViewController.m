//
//  ViewController.m
//  testEnum
//
//  Created by zhaoxu on 2017/7/18.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, ZXActionType) {
    ZXActionTypeOne,
    ZXActionTypeTwo,
    ZXActionTypeThree,
};

//按位与 & 1&1==1 1&0==0 0&0==0 只要有0则为0
//按位或 | 1|1==1 1|0==1 0|0==0 只要有1则为1
typedef NS_OPTIONS(NSUInteger, ZXDataType) {
    ZXDataTypeOne = 1 << 0,//0001
    ZXDataTypeTwo = 1 << 1,//0010
    ZXDataTypeThree = 1 << 2,//0100
    ZXDataTypeFour = 1 << 3,//1000
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testOption:ZXDataTypeOne|ZXDataTypeFour|ZXDataTypeTwo dataType:ZXDataTypeThree];
}

- (void)testOption:(ZXDataType)type dataType:(ZXDataType)type1{
    type = type|ZXDataTypeThree;//增加选项
    type = type & (~ ZXDataTypeThree);//删除选项
    NSLog(@"contain = %lu", type & type1);
    if (type & type1) {
        NSLog(@"包含");
    }
    else{
        NSLog(@"不包含");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
