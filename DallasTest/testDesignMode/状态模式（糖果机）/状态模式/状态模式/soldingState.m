//
//  soldingState.m
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "soldingState.h"

@implementation soldingState
- (instancetype)initWithMachine:(gumabllMachine *)machine
{
    self = [super init];
    if (self) {
        self.machine = machine;
    }
    return self;
}

-(void)insertQuarter{
    NSLog(@"请等待我们正在出货，不要重复投币...");
}

-(void)ejectQuarter{
    NSLog(@"对不起，你已经购买了糖果，不能退款");
    
}


-(void)selectGumball{
    NSLog(@"重复点击按钮，不会得到更多糖果哦");
    
}
-(void)dispense{
    if (self.machine.count > 0) {
        self.machine.count --;
        self.machine.state = self.machine.noQuarterState;
        NSLog(@"糖果还剩下：%zd",self.machine.count);
    }else{
        NSLog(@"抱歉，没有糖果了，如果需要退款，请点击退币按钮");
        self.machine.state = self.machine.soldOutState;
    }
    
}

@end
