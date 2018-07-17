//
//  SqlServerDepartment.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "SqlServerDepartment.h"

@implementation SqlServerDepartment

-(void)insert:(NSString *)department{
    NSLog(@"向sqlserver数据库插入部门：%@",department);
}

-(void)getDepartment{
    NSLog(@"从sqlserver数据库获取到一条部门数据");
}

@end
