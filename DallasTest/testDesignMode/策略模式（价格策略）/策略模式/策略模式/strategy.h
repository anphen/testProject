//
//  strategy.h
//  策略模式
//
//  Created by Mia on 16/12/7.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol strategyInterface <NSObject>

/**
 计算价格

 @param goodsPrice 原件
 @return 折后价
 */
-(NSInteger)calcPrice:(NSInteger)goodsPrice;

@end
