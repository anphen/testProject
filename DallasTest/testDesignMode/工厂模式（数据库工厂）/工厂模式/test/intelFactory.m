//
//  intelFactory.m
//  test
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "intelFactory.h"
#import "interCpu753.h"
#import "AMDCpu753.h"
#import "AMDCpU1179.h"
#import "appleCpu1179.h"
#import "appleCpu753.h"
#import "interCpu1179.h"
#import "Cpu.h"

@implementation intelFactory
-(Cpu *)createCpuWithType:(NSInteger)type{
    Cpu *cpu = nil;
    if (type == 753) {
        cpu = [interCpu753 new];
    }else{
        cpu = [interCpu1179 new];
    }
    return cpu;
}


-(Cpu *)selectCpuWithType:(NSString *)type{
    Cpu *cpu = nil;
    if ([type isEqualToString:@"intel1179"]) {
        cpu = [interCpu1179 new];
        
    }else if([type isEqualToString:@"intel753"]){
        cpu = [interCpu753 new];
        
    }else if([type isEqualToString:@"AMD1179"]){
        cpu = [AMDCpU1179 new];
        
    }else if([type isEqualToString:@"AMD753"]){
        cpu = [AMDCpu753 new];
        
    }else if([type isEqualToString:@"apple1179"]){
        cpu = [appleCpu1179 new];
        
    }else if([type isEqualToString:@"apple753"]){
        cpu = [appleCpu753 new];
        
    }else{
        return nil;
    }return  cpu;
}

@end
