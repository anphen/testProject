//
//  quackCounter.h
//  装饰者模式
//
//  Created by Mia on 16/11/4.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "quackInterface.h"

@interface quackCounter : NSObject<quackInterface>
@property(assign,nonatomic)NSInteger counter;
- (instancetype)initWithDuck:(id<quackInterface>)duck;

@end
