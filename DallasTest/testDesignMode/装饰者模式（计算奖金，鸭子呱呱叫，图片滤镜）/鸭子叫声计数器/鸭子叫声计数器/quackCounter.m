//
//  quackCounter.m
//  装饰者模式
//
//  Created by Mia on 16/11/4.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "quackCounter.h"
#import "Duck.h"


@interface quackCounter()
@property(strong,nonatomic)id<quackInterface> duck;
@end


@implementation quackCounter

- (instancetype)initWithDuck:(id<quackInterface>)duck
{
    self = [super init];
    if (self) {
        self.duck = duck;
    }
    return self;
}

-(void)quack{
    [self.duck quack];
    self.counter ++;
}

@end
