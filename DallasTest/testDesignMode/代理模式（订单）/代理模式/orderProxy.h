//
//  orderProxy.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "orderInterface.h"
#import "order.h"

@interface orderProxy : NSProxy<orderInterface>
- (instancetype)initWithOrder:(order* )order;
@end
