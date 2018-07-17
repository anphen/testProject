//
//  NationalDayStrategy.m
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "NationalDayStrategy.h"

@implementation NationalDayStrategy

-(NSInteger)calcPrice:(NSInteger)goodsPrice{
    return goodsPrice * 0.5 - 12;
}
@end
