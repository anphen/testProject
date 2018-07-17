//
//  CDPlayOnCommand.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "CDPlayOnCommand.h"
#import "serialObject.h"
#import  <objc/runtime.h>

@implementation CDPlayOnCommand
-(instancetype)initWithPlayer:(CDPlayer *)player{
    if (self == [super init]) {
        self.player = player;
    }
    
    return self;
}
-(void)execute{
    [self.player CDOn];
    [self.player setVolume:11];
}

-(void)undo{
    [self.player CDOff];
    [self.player setVolume:0];
}

SERIALIZE_CODER_DECODER()

@end
