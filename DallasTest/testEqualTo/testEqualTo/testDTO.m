//
//  testDTO.m
//  testEqualTo
//
//  Created by zhaoxu on 2017/9/3.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "testDTO.h"

@implementation testDTO

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[testDTO class]]) {
        return NO;
    }
    
    return [self isEqualToPerson:(testDTO *)object];
}

- (BOOL)isEqualToPerson:(testDTO *)person {
    if (!person) {
        return NO;
    }
    BOOL haveEqualNames = (!self.code && !person.code) || [self.code isEqualToString:person.code];
    
    return haveEqualNames;
}

@end
