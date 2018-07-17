//
//  main.m
//  鸭子叫声计数器
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "quackInterface.h"
#import "Duck.h"
#import "quackCounter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        quackCounter *qc = [[quackCounter alloc]initWithDuck:[Duck new]];
        [qc quack];
        [qc quack];
        [qc quack];
        NSLog(@"鸭子叫了：%zd次", qc.counter);

    }
    return 0;
}
