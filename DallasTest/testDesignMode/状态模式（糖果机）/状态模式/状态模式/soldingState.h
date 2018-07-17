//
//  soldingState.h
//  状态模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stateInterface.h"
#import "gumabllMachine.h"

@interface soldingState : NSObject<stateInterface>
@property(strong,nonatomic)gumabllMachine *machine;
- (instancetype)initWithMachine:(gumabllMachine *)machine;

@end
