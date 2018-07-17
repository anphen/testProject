//
//  CDPlayer.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "CDPlayer.h"
#import <objc/runtime.h>
#import "serialObject.h"
@implementation CDPlayer
-(void)CDOn{
    NSLog(@"CD播放器被打开");
}

-(void)CDOff{
    NSLog(@"CD播放器被关闭");
}

-(void)setVolume:(NSInteger)volume{
    NSLog(@"设置声音大小为：%zd",volume);
}

SERIALIZE_CODER_DECODER()

@end
