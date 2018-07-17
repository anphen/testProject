//
//  Decorator.m
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "Decorator.h"

@implementation Decorator
- (instancetype)initWithComponet:(component *)component
{
    self = [super init];
    if (self) {
        self.components = component;
    }
    return self;
}

-(NSInteger)calculateSalary:(NSInteger)monthSales sumSales:(NSInteger)sumSales{
    return [self.components calculateSalary:monthSales sumSales:sumSales];
}
@end
