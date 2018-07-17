//
//  main.m
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gumabllMachine.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        gumabllMachine *machine = [[gumabllMachine alloc]initWithGumabllCount:1];
        [machine machineInsertQuarter];
        [machine machineEjectQuarter];
        [machine machineselectGumball];
        [machine machineInsertQuarter];
        [machine machineDispense];
        [machine machineInsertQuarter];
        [machine machineInsertQuarter];
        [machine machineselectGumball];
        [machine machineEjectQuarter];
        [machine machineDispense];
        [machine machineDispense];
        [machine machineInsertQuarter];
        [machine machineselectGumball];
        [machine machineInsertQuarter];
        [machine machineDispense];
        [machine machineEjectQuarter];
        
    }
    return 0;
}
