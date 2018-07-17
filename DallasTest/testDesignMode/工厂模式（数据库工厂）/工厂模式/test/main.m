//
//  main.m
//  test
//
//  Created by Mia on 16/11/21.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "factory.h"
#import "Cpu.h"
#import "intelFactory.h"
#import "appleFactory.h"
#import "AMDFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        factory *factory = nil;
        factory = [intelFactory new];
        Cpu *cpu1 = [factory createCpuWithType:753];
        [cpu1 installCpu];
        Cpu *cpu2 = [factory createCpuWithType:1179];
        [cpu2 installCpu];
        
        factory = [AMDFactory new];
        Cpu *cpu3 = [factory createCpuWithType:753];
        [cpu3 installCpu];
        Cpu *cpu4 = [factory createCpuWithType:1179];
        [cpu4 installCpu];

        
    }
    return 0;
}




