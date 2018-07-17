//
//  order.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "orderInterface.h"

@interface order : NSObject<orderInterface>

@property(strong,nonatomic)NSString *orderOperator;
@property(strong,nonatomic)NSString *productName;
@property(assign,nonatomic)NSInteger productAmount;
@property(strong,nonatomic)NSString *orderSignTime;


- (instancetype)initWithName:(NSString *)operator name:(NSString *)name amount:(NSInteger)amount time:(NSString *)time;
@end
