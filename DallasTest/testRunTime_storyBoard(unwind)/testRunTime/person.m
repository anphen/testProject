//
//  person.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "person.h"
#import "NSObject+code.h"
#import <objc/runtime.h>

@implementation person

+ (void)run{
    NSLog(@"====== run =======");
}

+ (void)study{
    NSLog(@"====== study =======");
}

- (void)eat{
    NSLog(@"====== eat =======");
}

- (NSArray *)ignoreKeys
{
   return @[];
}


// void(*)()
// 默认方法都有两个隐式参数，
void speak(id self,SEL sel)
{
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}



// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
// 刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
#pragma clang diagnostic ignored"-Wvector-conversion"
    if (sel == @selector(speak)) {
        // 动态添加eat方法
        // 第一个参数：给哪个类添加方法
        // 第二个参数：添加方法的方法编号
        // 第三个参数：添加方法的函数实现（函数地址）
        // 第四个参数：函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, @selector(speak), speak, "v@:");
    }
#pragma clang diagnostic pop

    return [super resolveInstanceMethod:sel];
}



ZXCodingImplementation

@end
