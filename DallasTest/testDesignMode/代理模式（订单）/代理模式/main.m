//
//  main.m
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "proxy.h"
#import "realSubject.h"

#import "order.h"
#import "orderProxy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~实例一~~~~~~~~~~~~~~~~~~~~~~");
        proxy *pro = [[proxy alloc]initWithRealSubject:[realSubject new]];
        //先获取简单的数据，此时只有name和age字段
        [pro getSimpleInfo];
        //获取完整的数据，包括所有信息
        [pro getCompleteInfo];

        
        NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~实例二~~~~~~~~~~~~~~~~~~~~~~");

        order *ord = [[order alloc]initWithName:@"张三" name:@"电脑订单" amount:1000 time:@"2016-10-11"]; 
        orderProxy *proxy = [[orderProxy alloc]initWithOrder:ord];
        [proxy changeProductName:@"办公椅订单" operator:@"李四"];
        [proxy queryOrder];

        [proxy changeProductName:@"办公椅订单" operator:@"张三"];
        [proxy queryOrder];

        [proxy changeProductName:@"台灯订单" operator:@"张三"];
        [proxy queryOrder];



    }
    return 0;
}
