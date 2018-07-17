//
//  CDDriver.m
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "CDDriver.h"
#import "mainBoard.h"

@implementation CDDriver
-(void)readCD{
    NSString *data = @"BBC地球探索之旅";
    NSMutableString *mStr = [[NSMutableString alloc]initWithString:data];
    [[mainBoard shareInstance] handleData:mStr dataSource:self];
}
@end
