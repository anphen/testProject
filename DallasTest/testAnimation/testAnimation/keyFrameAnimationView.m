//
//  keyFrameAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "keyFrameAnimationView.h"

@implementation keyFrameAnimationView

- (void)configAnimation
{
    [super configAnimation];
    self.animationView.center = self.center;
}

- (void)beginAnimation
{
//    圆形路径
    CAKeyframeAnimation *kfAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(kScreenWidth/2-100, kScreenWidth/2-100, 200, 200 )];
    kfAnimation.path = path.CGPath;
    kfAnimation.duration = 2.0;
    kfAnimation.fillMode = kCAFillModeForwards;
    kfAnimation.removedOnCompletion = NO;
    kfAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeIn"];
    [self.animationView.layer addAnimation:kfAnimation forKey:@"pathAnimation"];
}

@end
