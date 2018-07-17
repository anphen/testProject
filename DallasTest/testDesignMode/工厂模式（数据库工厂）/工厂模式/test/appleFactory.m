//
//  appleFactory.m
//  test
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "appleFactory.h"
#import "appleCpu753.h"
#import "appleCpu1179.h"

@implementation appleFactory
-(Cpu *)createCpuWithType:(NSInteger)type{
    Cpu *cpu = nil;
    if (type == 753) {
        cpu = [appleCpu753 new];
    }else{
        cpu = [appleCpu1179 new];
    }
    return cpu;
}

@end
