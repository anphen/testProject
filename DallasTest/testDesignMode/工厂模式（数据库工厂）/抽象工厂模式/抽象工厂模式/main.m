//
//  main.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFactory.h"
#import "IUser.h"
#import "IDepartment.h"
#import "SqlServerFactory.h"
#import "AccessFactory.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        id<IFactory> DBFactory = [AccessFactory new];
        IUser *user = [DBFactory createUser];
        IDepartment *deparment = [DBFactory createDepartment];
        
        //业务逻辑
        [user insert:@"张三"];
        [user getUser];
        [deparment insert:@"财务"];
        [deparment getDepartment];
        
    }
    return 0;
}
