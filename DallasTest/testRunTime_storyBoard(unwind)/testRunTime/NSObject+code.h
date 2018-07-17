//
//  NSObject+code.h
//  testRunTime
//
//  Created by zhaoxu on 2018/1/23.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (code)

- (NSArray *)ignoreKeys;

- (void)encode:(NSCoder *)aCode;

- (void)decode:(NSCoder *)aDecode;

/**
 归档的实现
 */
#define ZXCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode:encoder]; \
}

#define ZXExtensionCodingImplementation ZXCodingImplementation


@end
