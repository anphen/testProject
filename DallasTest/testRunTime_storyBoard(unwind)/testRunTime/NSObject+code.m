//
//  NSObject+code.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/23.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "NSObject+code.h"
#import <objc/runtime.h>

@implementation NSObject (code)

- (NSArray *)ignoreKeys{
    return @[];
}


- (void)encode:(NSCoder *)aCode{
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList( c, &count);
        
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivarList[i];
            
            NSString *keyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoreKeys)]) {
                if ([[self ignoreKeys]containsObject:keyName]) {
                    continue;
                }
            }
            id value = [self valueForKey:keyName];
            [aCode encodeObject:value forKey:keyName];
        }
     
        free(ivarList);
        c = [c superclass];
    }
}

- (void)decode:(NSCoder *)aDecode{
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList( c, &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivarList[i];
            
            NSString *keyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
            if ([self respondsToSelector:@selector(ignoreKeys)]) {
                if ([[self ignoreKeys]containsObject:keyName]) {
                    continue;
                }
            }
            id value = [aDecode decodeObjectForKey:keyName];
            [self setValue:value forKey:keyName];
        }
        free(ivarList);
        c = [c superclass];
    }
}
@end
