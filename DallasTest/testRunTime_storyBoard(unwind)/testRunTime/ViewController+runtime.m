//
//  ViewController+runtime.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController+runtime.h"
#import "person.h"
#import <objc/runtime.h>
#import <objc/message.h>
//#import <objc/message.h>

@implementation ViewController (runtime)

- (void)msgSent{
    
//    objc_msgSend([person class], @selector(run));
//    person *p1 = [[person alloc]init];
//    objc_msgSend(p1 , @selector(eat));
}

- (void)exchangeImp{
    [person run];
    [person study];
    Method method1 = class_getClassMethod([person class], @selector(run));
    Method method2 = class_getClassMethod([person class], @selector(study));
    method_exchangeImplementations(method1, method2);
    [person run];
    [person study];
}

char nameKey;

- (void)setVcName:(NSString *)vcName
{
    objc_setAssociatedObject(self, &nameKey, vcName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)vcName
{
    return objc_getAssociatedObject(self, &nameKey);
}

- (void)printPersonProAndType{
    unsigned int count = 0;
    Ivar *ivarList =  class_copyIvarList([person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar_i = ivarList[i];
        const char *name = ivar_getName(ivar_i);
        const char *type = ivar_getTypeEncoding(ivar_i);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivarList);
}

- (void)archivePerson{
    person *p1 = [[person alloc]init];
    p1.name = @"xiaoming";
    p1.age = @"17";
    p1.height = @"187";
    p1.weight = @"120";
    
    //cache
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"person.archiver"];
    NSLog(@"path=%@",path);
    [NSKeyedArchiver archiveRootObject:p1 toFile:path];
    
    person *p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (p2) {
        NSLog(@"%@ = %@ = %@ = %@", p2.name, p2.age, p2.height, p2.weight);
    }
}

- (void)addMethod{
    person *p = [[person alloc]init];
    [p performSelector:@selector(speak)];
}

@end
