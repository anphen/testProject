//
//  abstractMessage.m
//  桥接模式
//
//  Created by Mia on 16/12/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "abstractMessage.h"

@implementation abstractMessage

- (instancetype)initWithImplement:(id<messageImplement>)implement
{
    self = [super init];
    if (self) {
        self.messageIm = implement;
    }
    return self;
}

-(void)send:(NSMutableString*)message{
    
}

@end
