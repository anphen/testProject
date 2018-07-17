//
//  superSCView.m
//  testHitTest
//
//  Created by zhaoxu on 2017/6/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "superSCView.h"

@implementation superSCView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (hitTestView) {
        hitTestView = self.scrollView;
    }
    return hitTestView;
}

@end
