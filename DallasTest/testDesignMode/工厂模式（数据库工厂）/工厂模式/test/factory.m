//
//  factory.m
//  test
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "factory.h"

@implementation factory
-(Cpu *)createCpuWithType:(NSInteger)type{
    @throw ([NSException exceptionWithName:@"继承错误" reason:@"子类必须重写该方法" userInfo:nil]);
    return nil;
}
@end
