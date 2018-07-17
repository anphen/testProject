//
//  LightOffCommand.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "LightOffCommand.h"
#import "serialObject.h"
#import  <objc/runtime.h>

@implementation LightOffCommand
-(instancetype)initWithLight:(Light *)light{
    if (self == [super init]) {
        self.light = light;
    }
    
    return self;
}
-(void)execute{
    [self.light lightOff];
}

-(void)undo{
    [self.light lightOn];
}

SERIALIZE_CODER_DECODER()

@end
