//
//  AccessFactory.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "AccessFactory.h"
#import "AccessUser.h"
#import "AccessDepartment.h"

@implementation AccessFactory
-(IUser *)createUser{
    return [AccessUser new];
}

-(IDepartment *)createDepartment{
    return [AccessDepartment new];
}
@end
