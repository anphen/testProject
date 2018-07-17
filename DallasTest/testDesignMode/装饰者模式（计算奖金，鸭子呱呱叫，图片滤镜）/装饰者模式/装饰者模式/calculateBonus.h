//
//  calculateBonus.h
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculateBonus : NSObject
-(NSInteger)calculateSalary:(NSInteger)monthSales  sumSales:(NSInteger)sumSales isManager:(BOOL)manager;
@end
