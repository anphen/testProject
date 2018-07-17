//
//  Light.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "Light.h"
#import <objc/runtime.h>

@implementation Light

-(void)lightOn{
    NSLog(@"灯被打开");
}

-(void)lightOff{
    NSLog(@"灯被关闭");
}

SERIALIZE_CODER_DECODER()
@end
