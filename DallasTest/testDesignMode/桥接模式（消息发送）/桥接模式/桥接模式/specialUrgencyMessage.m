//
//  specialUrgencyMessage.m
//  桥接模式
//
//  Created by Mia on 16/12/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "specialUrgencyMessage.h"

@implementation specialUrgencyMessage

-(void)send:(NSMutableString *)message{
    [message insertString:@"【特别加急消息：" atIndex:0];
    [message appendString:@"】"];
    [self.messageIm sendMessage:message];
}

@end
