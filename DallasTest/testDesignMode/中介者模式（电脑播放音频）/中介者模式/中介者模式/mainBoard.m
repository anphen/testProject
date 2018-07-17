//
//  mainBoard.m
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "mainBoard.h"
#import "CPU.h"
#import "CDDriver.h"
#import "VideoCard.h"

static mainBoard *instance = nil;

@implementation mainBoard
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(instance == nil){
            instance = [[self alloc]init];
        }
    });
    
    return instance;
}

-(void)handleData:(NSMutableString *)data dataSource:(id)source{
    if  ([source isKindOfClass:[CDDriver class]]){
        CPU *cpu = [CPU new];
        [cpu executeData:data];
    }else if ([source isKindOfClass:[CPU class]]){
        VideoCard *video = [VideoCard new];
        [video executeData:data];
        
    }
}

@end
