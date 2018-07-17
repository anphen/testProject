//
//  hasQUarterState.m
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "hasQUarterState.h"

@implementation hasQUarterState
- (instancetype)initWithMachine:(gumabllMachine *)machine
{
    self = [super init];
    if (self) {
        self.machine = machine;
    }
    return self;
}

-(void)insertQuarter{
    NSLog(@"你已经塞入了一枚硬币，不要重复投币");
}

-(void)ejectQuarter{
    NSLog(@"硬币即将推出");
    self.machine.state = self.machine.noQuarterState;

}


-(void)selectGumball{
    NSLog(@"你选择购买糖果，处理中....");
    self.machine.state = self.machine.soldingState;

    
}
-(void)dispense{
    NSLog(@"请先选择购买糖果");
}

@end
