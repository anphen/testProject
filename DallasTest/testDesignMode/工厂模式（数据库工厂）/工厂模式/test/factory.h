//
//  factory.h
//  test
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cpu.h"

@interface factory : NSObject
-(Cpu*)createCpuWithType:(NSInteger)type;

@end
