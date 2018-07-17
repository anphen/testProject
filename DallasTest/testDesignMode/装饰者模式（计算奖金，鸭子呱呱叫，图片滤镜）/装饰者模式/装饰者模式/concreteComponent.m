//
//  concreteComponent.m
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//


//被装饰对象，基本工资

#import "concreteComponent.h"

@implementation concreteComponent

-(NSInteger)calculateSalary:(NSInteger)monthSales  sumSales:(NSInteger)sumSales{
    //基本工资8000
    return 8000;
}

@end
