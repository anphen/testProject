//
//  Price.h
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "strategy.h"

@interface Price : NSObject
@property(strong,nonatomic)id<strategyInterface> strategy;

/**
 初始化价格

 @param strategy 价格策略
 @return 类实例
 */
- (instancetype)initWithStrategy:(id<strategyInterface>)strategy;

/**
 报价

 @param goodsPrice 原价
 @return 通过策略处理后的报价
 */
- (NSInteger)quotePirce:(NSInteger)goodsPrice;
@end
