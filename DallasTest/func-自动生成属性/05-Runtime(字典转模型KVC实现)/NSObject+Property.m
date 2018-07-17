//
//  NSObject+Property.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];

    
     NSLog(@"%@",strM);
    
    for (int i = 0 ; i<dict.allKeys.count; i++) {
        NSString *code;
        NSString *propertyName = dict.allKeys[i];
        NSString *value = [dict valueForKey:propertyName];
        if ([value isKindOfClass:NSClassFromString(@"NSString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"NSNumber")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"NSArray")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"NSDictionary")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        [strM appendFormat:@"\n%@\n",code];
    }
    NSLog(@"%@",strM);
    
}

@end
