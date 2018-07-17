//
//  macroCommand.m
//  命令模式
//
//  Created by Mia on 16/11/2.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "macroCommand.h"
#import "serialObject.h"
#import <objc/message.h>

@implementation macroCommand

- (instancetype)initWithCommands:(NSArray<id<CommandInterface>>*)commands
{
    self = [super init];
    if (self) {
        self.commandsArr = commands;
    }
    return self;
}

-(void)execute{
    for (id<CommandInterface>command in self.commandsArr) {
        [command execute];
    }
}

//和单个命令的撤销操作类似，就不在演示了
-(void)undo{
    NSLog(@"宏命令懒得写撤销操作");
}

SERIALIZE_CODER_DECODER()

@end
