//
//  TestInstance.m
//  TestSingleton
//
//  Created by xu zhao on 2018/8/28.
//  Copyright © 2018年 xu zhao. All rights reserved.
//

#import "TestInstance.h"

@implementation TestInstance


+ (instancetype)ShareInstance{
    static TestInstance *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TestInstance alloc]init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self ShareInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self ShareInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    
    return [self ShareInstance];
}

@end
