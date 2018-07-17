//
//  AMDFactory.m
//  test
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "AMDFactory.h"
#import "AMDCpU1179.h"
#import "AMDCpu753.h"

@implementation AMDFactory
-(Cpu *)createCpuWithType:(NSInteger)type{
    Cpu *cpu = nil;
    if (type == 753) {
        cpu = [AMDCpu753 new];
    }else{
        cpu = [AMDCpU1179 new];
    }
    return cpu;
}
@end
