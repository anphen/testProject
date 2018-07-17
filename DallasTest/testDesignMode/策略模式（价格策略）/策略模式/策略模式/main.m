//
//  main.m
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "strategy.h"
#import "NormalStrategy.h"
#import "discountStrategy.h"
#import "NationalDayStrategy.h"
#import "Price.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        id<strategyInterface>  strategy = [NationalDayStrategy new];
        Price *quote = [[Price alloc]initWithStrategy:strategy];
        NSInteger quotePrice = [quote quotePirce:10002];
        NSLog(@"处理后的商品价格为：%zd", quotePrice);
        
    }
    return 0;
}


