//
//  main.m
//  test
//
//  Created by Mia on 16/11/21.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "simpleFactory.h"
#import "Cpu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        simpleFactory *factory = [simpleFactory new];
        Cpu *cpu = [factory selectCpuWithType:@"interCpu"];
        [cpu installCpu];
    }
    return 0;
}


