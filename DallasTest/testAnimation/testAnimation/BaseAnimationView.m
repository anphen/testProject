//
//  baseAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "BaseAnimationView.h"

@interface BaseAnimationView()<CAAnimationDelegate>

@end

@implementation BaseAnimationView

- (void)configAnimation
{
    [super configAnimation];

    self.animationView.center = self.center;
    self.animationView.bounds = CGRectMake(0, 0, 100, 100);
    self.operateArray = @[@"位移",@"透明度",@"缩放",@"背景色",@"旋转",];
}

- (void)beginAnimation{
//    注意点
//    如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
}

- (void)operateAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            //位移
            [self positionAnimation];

        }
            break;
        case 1:
        {
            //透明度
            [self opacityAnimation];

        }
            break;
        case 2:
        {
            //缩放
            [self scaleAnimation];

        }
            break;
        case 3:
        {
            //背景色
            [self backgroundColorAnimation];
        }
            break;
        case 4:
        {
            //旋转
            [self rotateAnimation];
        }
            break;
            
        default:
            break;
    }
}

- (void)positionAnimation
{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    baseAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-75)];
    baseAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-75)];
    baseAnimation.duration = 1.0f;
    [self.animationView.layer addAnimation:baseAnimation forKey:@"positionAnimation"];
}

- (void)opacityAnimation{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    baseAnimation.fromValue = [NSNumber numberWithInt:0];
    baseAnimation.toValue = [NSNumber numberWithInt:1];
    baseAnimation.duration = 2.0f;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.removedOnCompletion = NO;
    
    [self.animationView.layer addAnimation:baseAnimation forKey:@"opacity"];
}

- (void)scaleAnimation{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    baseAnimation.toValue = [NSNumber numberWithFloat:2.0f];
    baseAnimation.duration = 2.0f;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.removedOnCompletion = NO;
    baseAnimation.delegate = self;
    [self.animationView.layer addAnimation:baseAnimation forKey:@"transform.scale"];
}

- (void)backgroundColorAnimation{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    baseAnimation.fromValue = (__bridge id _Nullable)(kRandomColor.CGColor);
    baseAnimation.toValue = (__bridge id _Nullable)(kRandomColor.CGColor);
    baseAnimation.duration = 2.0f;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.removedOnCompletion = NO;
    baseAnimation.delegate = self;
    [self.animationView.layer addAnimation:baseAnimation forKey:@"backgroundColor"];
}

- (void)rotateAnimation{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    baseAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    baseAnimation.toValue =  [NSNumber numberWithFloat:M_PI * 2];
    baseAnimation.duration = 2.0f;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.removedOnCompletion = NO;
    baseAnimation.delegate = self;
    //    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeIn"];
    //    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeOut"];
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    //      baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"linear"];
    //    baseAnimation.repeatCount = 500;
    [self.animationView.layer addAnimation:baseAnimation forKey:@"transform.rotation.z"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim{
    kLogFunction
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    kLogFunction
}

@end
