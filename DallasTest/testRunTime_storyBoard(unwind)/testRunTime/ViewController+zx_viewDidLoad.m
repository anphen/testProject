//
//  ViewController+zx_viewDidLoad.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController+zx_viewDidLoad.h"
#import <objc/runtime.h>

@implementation UIViewController (zx_viewDidLoad)

+ (void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method m2 = class_getInstanceMethod([self class], @selector(zx_viewDidLoad));
    
    if (!class_addMethod([self class], @selector(zx_viewDidLoad), method_getImplementation(m2), method_getTypeEncoding(m2))) {
        method_exchangeImplementations(m1, m2);
    }
}

- (void)zx_viewDidLoad{
    NSLog(@"%s", __func__);
    NSLog(@"==============zx_viewDidLoad===========");
    [self zx_viewDidLoad];
}

@end
