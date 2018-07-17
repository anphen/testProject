//
//  htmlBuilder.h
//  建造者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bulierInterface.h"

@interface htmlBuilder : NSObject<bilerInterface>
- (instancetype)initWithData:(NSString *)data;

@end
