//
//  SqlServerUser.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "SqlServerUser.h"

@implementation SqlServerUser
-(void)insert:(NSString *)user{
    NSLog(@"向sqlserver数据库插入用户：%@", user);
}

-(void)getUser{
    NSLog(@"从sqlserver数据库获取到一条用户数据");
}
@end
