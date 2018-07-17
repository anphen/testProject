//
//  noCommand.m
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "noCommand.h"

@implementation noCommand
-(void)execute{
    NSLog(@"该插槽没有安装命令");
}

-(void)undo{
    NSLog(@"命令被撤销");
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    return self;
    
}

@end
