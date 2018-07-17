//
//  AccessDepartment.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "AccessDepartment.h"

@implementation AccessDepartment

-(void)insert:(NSString *)department{
    NSLog(@"向access数据库插入部门：%@",department);
}

-(void)getDepartment{
    NSLog(@"从access数据库获取到一条部门数据");
}

@end
