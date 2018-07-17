//
//  ViewController.m
//  testIOSSummary1
//
//  Created by zhaoxu on 2017/7/13.
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

- (UIViewController *)getVisibleViewControllerFrom:(UIViewController*)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController*) vc) visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        return [self getVisibleViewControllerFrom:[((UITabBarController*) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testGroup];
}

- (void)testGroup{
    dispatch_queue_t testQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t testGroup = dispatch_group_create();
    dispatch_group_enter(testGroup);
    dispatch_async(testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test1== %@ == index = %i ==", [NSThread currentThread],i);
        }
        dispatch_group_leave(testGroup);
    });
    
    dispatch_group_enter(testGroup);
    dispatch_async(testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test2== %@ == index = %i ==", [NSThread currentThread],i);
        }
        dispatch_group_leave(testGroup);
    });
    dispatch_group_enter(testGroup);
    dispatch_async(testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test3== %@ == index = %i ==", [NSThread currentThread],i);
        }
        dispatch_group_leave(testGroup);
    });
    dispatch_group_notify(testGroup, testQueue, ^{
        NSLog(@"++++++++++++++end++++++++++");
    });
}

@end
