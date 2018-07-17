//
//  main.m
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calculateBonus.h"
#import "Decorator.h"
#import "monthBonusDecorator.h"
#import "sumBonusDecatorator.h"
#import "groupBonusDecorator.h"
#import "concreteComponent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //基本工资，被装饰对象
        component *c1 = [concreteComponent new];
        
        //装饰器
        Decorator *d1 = [[monthBonusDecorator alloc]initWithComponet:c1];
        Decorator *d2 = [[sumBonusDecatorator alloc]initWithComponet:d1];
        NSInteger salary1 = [d2 calculateSalary:10000 sumSales:12212];
        NSLog(@"\n奖金组合方式：当月销售奖金 + 累积销售奖金 \n 总工资 = %zd", salary1);
        
        NSLog(@"\n=============================================================================");
        
        Decorator *d3 = [[monthBonusDecorator alloc]initWithComponet:c1];
        Decorator *d4 = [[sumBonusDecatorator alloc]initWithComponet:d3];
        Decorator *d5 = [[groupBonusDecorator alloc]initWithComponet:d4];
        NSInteger salary2 = [d5 calculateSalary:12100 sumSales:12232];
        NSLog(@"\n奖金组合方式：当月销售奖金 + 累积销售奖金 + 团队奖金 \n 总工资 = %zd", salary2);
        
        
        NSLog(@"\n=============================================================================");

        Decorator *d6 = [[monthBonusDecorator alloc]initWithComponet:c1];
        Decorator *d7 = [[groupBonusDecorator alloc]initWithComponet:d6];
        NSInteger salary3 = [d7 calculateSalary:23111 sumSales:231111];
        NSLog(@"\n奖金组合方式：当月销售奖金 + 团队奖金 \n 总工资 = %zd", salary3);
        
    }
    return 0;
}
