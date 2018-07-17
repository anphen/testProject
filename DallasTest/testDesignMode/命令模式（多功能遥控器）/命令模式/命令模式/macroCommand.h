//
//  macroCommand.h
//  命令模式
//
//  Created by Mia on 16/11/2.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandInterface.h"

@interface macroCommand : NSObject<CommandInterface,NSCoding>
@property(strong,nonatomic)NSArray<id<CommandInterface>> *commandsArr;
- (instancetype)initWithCommands:(NSArray<id<CommandInterface>>*)commands;
@end
