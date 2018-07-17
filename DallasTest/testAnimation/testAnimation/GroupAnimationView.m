//
//  GroupAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "GroupAnimationView.h"

@implementation GroupAnimationView

- (void)configAnimation
{
    [super configAnimation];
    self.animationView.center = self.center;
}

-(void)beginAnimation
{
    
    //同事不同时可以设置beginTime来区分
    
    //组合动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
   

    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
    group.animations = @[anima1,anima2,anima3];
    group.duration = 4.0f;
    [self.animationView.layer addAnimation:group forKey:@"groupAnimation"];
}
@end
