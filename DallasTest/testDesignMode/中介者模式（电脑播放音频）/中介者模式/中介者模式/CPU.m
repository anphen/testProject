//
//  CPU.m
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "CPU.h"
#import "mainBoard.h"

@implementation CPU
-(void )executeData:(NSMutableString *)data{
    [data appendString:@"+经过cpu处理"];
    [[mainBoard shareInstance] handleData:data dataSource:self];
}
@end
