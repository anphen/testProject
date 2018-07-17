//
//  gumabllMachine.h
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stateInterface.h"

@interface gumabllMachine : NSObject
-(void)setState:(id<stateInterface>)state;
@property(strong,nonatomic)id<stateInterface> state;
@property(strong,nonatomic)id<stateInterface> soldOutState;
@property(strong,nonatomic)id<stateInterface> noQuarterState;
@property(strong,nonatomic)id<stateInterface> hasQuarterState;
@property(strong,nonatomic)id<stateInterface> soldingState;
@property(assign,nonatomic)NSInteger count;


/**
 初始化

 @param count 糖果数量
 @return 类实例
 */
- (instancetype)initWithGumabllCount:(NSInteger)count;

/**
 投入硬币
 */
-(void)machineInsertQuarter;

/**
 退钱
 */
-(void)machineEjectQuarter;

/**
 选择糖果

 */
-(void)machineselectGumball;

/**
 执行
 */
-(void)machineDispense;


@end
