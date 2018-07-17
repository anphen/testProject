//
//  gumabllMachine.m
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "gumabllMachine.h"
#import "noQuarterState.h"
#import "hasQUarterState.h"
#import "soldingState.h"
#import "soldOutState.h"

@implementation gumabllMachine
- (instancetype)initWithGumabllCount:(NSInteger)count
{
    self = [super init];
    if (self) {
        self.count =count;
        self.noQuarterState = [[noQuarterState alloc]initWithMachine:self];
        self.hasQuarterState = [[hasQUarterState alloc]initWithMachine:self];
        self.soldingState = [[soldingState alloc]initWithMachine:self];
        self.soldOutState = [[soldOutState alloc]initWithMachine:self];
        if (self.count > 0) self.state = self.noQuarterState;
        
    }
    return self;
}



-(void)machineInsertQuarter{
    [self.state insertQuarter];
}

-(void)machineEjectQuarter{
    [self.state ejectQuarter];
}


-(void)machineselectGumball{
    [self.state selectGumball];
}

-(void)machineDispense{
    [self.state dispense];
}
@end
