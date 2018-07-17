//
//  Price.m
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "Price.h"

@implementation Price

- (instancetype)initWithStrategy:(id<strategyInterface>)strategy
{
    self = [super init];
    if (self) {
        self.strategy = strategy;
    }
    return self;
}


-(NSInteger)quotePirce:(NSInteger)goodsPrice{
    return [self.strategy calcPrice:goodsPrice];
}
@end
