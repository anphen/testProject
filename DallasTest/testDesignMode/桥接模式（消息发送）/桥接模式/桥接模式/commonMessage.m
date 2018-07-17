//
//  commonMessage.m
//  桥接模式
//
//  Created by Mia on 16/12/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "commonMessage.h"

@implementation commonMessage

-(void)send:(NSMutableString *)message{
    [message insertString:@"【普通消息：" atIndex:0];
    [message appendString:@"】"];
    [self.messageIm sendMessage:message];
}
@end
