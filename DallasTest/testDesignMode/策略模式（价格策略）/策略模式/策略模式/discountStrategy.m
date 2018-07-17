//
//  discountStrategy.m
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "discountStrategy.h"

@implementation discountStrategy

-(NSInteger)calcPrice:(NSInteger)goodsPrice{
    return goodsPrice * 0.76;
}
@end
