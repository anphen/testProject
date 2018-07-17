//
//  ViewController.m
//  testUIWindow
//
//  Created by zhaoxu on 2017/7/6.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "DefineConstant.h"
#import "UIView+SNFoundation.h"
#import "test1Window.h"
#import "ViewController1.h"

@interface ViewController ()

@property (nonatomic, strong) UIViewController *rootVC;
@property (nonatomic, strong) test1Window *testWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"======%@", [UIApplication sharedApplication].keyWindow);
     NSLog(@"=======%@",[UIApplication sharedApplication].windows);
    test1Window *window1 = [[test1Window alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    window1.backgroundColor = [UIColor greenColor];
    _testWindow = window1;
    ViewController1 *vc1 = [[ViewController1 alloc]init];
//    UIViewController *rootVC = [[UIViewController alloc]init];
//    rootVC.view.backgroundColor = [UIColor redColor];
//    window1.rootViewController = rootVC;
//    _rootVC = rootVC;
//    _testWindow = window1;
    _testWindow.windowLevel = UIWindowLevelNormal;
    window1.rootViewController = vc1;
    [self.testWindow addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTestWindow)]];
    [window1 makeKeyAndVisible];
    NSLog(@"=======%@",[UIApplication sharedApplication].keyWindow);
     NSLog(@"=======%@",[UIApplication sharedApplication].windows);
}


- (void)removeTestWindow{
    self.testWindow = nil;
    NSLog(@"=======%@",[UIApplication sharedApplication].windows);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
