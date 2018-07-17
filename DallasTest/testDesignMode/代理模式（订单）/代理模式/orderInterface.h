//
//  orderInterface.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

@protocol orderInterface <NSObject>

/**
 操作订单

 @param productName 商品名称
 @param opreator 订单归属者
 */
-(void)changeProductName:(NSString *)productName operator:(NSString *)opreator;

/**
 查询订单
 */
-(void)queryOrder;

@end
