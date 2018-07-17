//
//  quackInterface.h
//  装饰者模式
//
//  Created by Mia on 16/11/4.
//  Copyright © 2016年 Mia. All rights reserved.
//


/*
 给鸭子的quack方法加上了统计次数的行为，但是没有改变鸭子的quack方法的本来的行为，这就是装饰器的作用。不改变类已经存在的行为，但是可以给类增加任意的新行为。
 */

#import <Foundation/Foundation.h>

@protocol quackInterface <NSObject>

-(void)quack;

@end
