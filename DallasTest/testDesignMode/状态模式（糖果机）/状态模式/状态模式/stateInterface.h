//
//  stateInterface.h
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol stateInterface <NSObject>

-(void)insertQuarter;
-(void)ejectQuarter;
-(void)selectGumball;
-(void)dispense;

@end
