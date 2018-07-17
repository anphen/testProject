//
//  calculateBonus.m
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "calculateBonus.h"

@implementation calculateBonus

-(NSInteger)calculateSalary:(NSInteger)monthSales  sumSales:(NSInteger)sumSales isManager:(BOOL)manager{
    //基本工资都是8000
    NSInteger salary = 8000;
    salary += [self monthBonus:monthSales];
    salary += [self sumBonus:sumSales];
    if (manager) {
        salary += [self groupBonus];
    }

    return salary;
    
}


//当月奖金
-(NSInteger)monthBonus:(NSInteger)monthSales{
    return monthSales * 0.003;
}


//累积奖金
-(NSInteger)sumBonus:(NSInteger)sumSales{
    return  sumSales * 0.001;
}

//团队奖金
-(NSInteger)groupBonus{
    //简单起见，团队的销售总额设置为100000
    return 100000 * 0.01;
}
@end
