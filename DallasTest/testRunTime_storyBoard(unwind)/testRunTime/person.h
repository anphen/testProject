//
//  person.h
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *weight;

+ (void)run;

+ (void)study;

- (void)eat;

@end
