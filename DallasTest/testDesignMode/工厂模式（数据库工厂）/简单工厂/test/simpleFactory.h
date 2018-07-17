//
//  simpleFactory.h
//  test
//
//  Created by Mia on 16/11/21.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cpu.h"

@interface simpleFactory : NSObject
-(Cpu *)selectCpuWithType:(NSString *)type;

@end
