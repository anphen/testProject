//
//  order.m
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "order.h"
@implementation order
- (instancetype)initWithName:(NSString *)operator name:(NSString *)name amount:(NSInteger)amount time:(NSString *)time
{
    self = [super init];
    if (self) {
        self.orderOperator = operator;
        self.productName = name;
        self.productAmount = amount;
        self.orderSignTime = time;
    }
    return self;
}


-(void)changeProductName:(NSString *)productName operator:(NSString *)opreator{
    self.productName = productName;
}

-(void)queryOrder{
    NSLog(@"\n订单名字：%@\n 订单操作员：%@\n 订单数量：%zd\n 订单签订时间：%@",self.productName,self.orderOperator,self.productAmount,self.orderSignTime);
}


@end
