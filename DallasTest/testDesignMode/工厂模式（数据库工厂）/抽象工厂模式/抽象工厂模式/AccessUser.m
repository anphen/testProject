//
//  AccessUser.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "AccessUser.h"

@implementation AccessUser
-(void)insert:(NSString *)user{
    NSLog(@"向access数据库插入用户：%@", user);
}

-(void)getUser{
    NSLog(@"从access数据库获取到一条用户数据");
}

@end
