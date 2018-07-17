//
//  simpleFactory.m
//  test
//
//  Created by Mia on 16/11/21.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "simpleFactory.h"
#import "interCpu.h"
#import "appleCpu.h"
#import "AMDCpU.h"

@implementation simpleFactory

-(Cpu *)selectCpuWithType:(NSString *)type{
    Cpu *cpu = (Cpu *)[NSClassFromString(type)new];
    if ([cpu isKindOfClass:[Cpu class]] && cpu) {
        return  cpu;
    }else{
        return nil;
    }
}

@end
