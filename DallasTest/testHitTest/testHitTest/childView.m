
//
//  childView.m
//  testHitTest
//
//  Created by zhaoxu on 2017/6/6.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "childView.h"
#import "DefineConstant.h"
#define kRandomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation childView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = kRandomColor;
        self.scale = 1.0;
    }
    return self;
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    if (_index == 0 ||_index == 10) {
        self.backgroundColor = [UIColor redColor];
    }
    
    if (_index == 1 ||_index == 11) {
        self.backgroundColor = [UIColor greenColor];
    }
    
}

@end
