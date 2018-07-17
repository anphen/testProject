//
//  LightOnCommand.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "LightOnCommand.h"
#import "serialObject.h"
#import  <objc/runtime.h>

@implementation LightOnCommand
-(instancetype)initWithLight:(Light *)light{
    if (self == [super init]) {
        self.light = light;
    }
    
    return self;
}

-(void)execute{
    [self.light lightOn];
}

-(void)undo{
    [self.light lightOff];
}

SERIALIZE_CODER_DECODER()

@end
