//
//  SqlServerFactory.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "SqlServerFactory.h"
#import "SqlServerUser.h"
#import "SqlServerDepartment.h"

@implementation SqlServerFactory

-(IUser *)createUser{
    return [SqlServerUser new];
}

-(IDepartment *)createDepartment{
    return [SqlServerDepartment new];
}
@end
