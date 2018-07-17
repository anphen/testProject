//
//  SimpleAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/7.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "SimpleAnimationView.h"

@implementation SimpleAnimationView

- (void)configAnimation
{
    [super configAnimation];
    self.operateArray = @[@"位移",@"弹性",@"关键帧"];
}

- (void)beginAnimation
{
}

- (void)operateAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            [self centerAnimation];
        }
            break;
        case 1:
        {
            [self dampingAnimation];
        }
            break;
        case 2:

        {
            [self keyframeAnimation];
        }
            break;
      
        default:
            break;
    }
}

- (void)centerAnimation
{
//    简单block动画
        self.animationView.frame = CGRectMake(0, 0, self.animationView.frame.size.width, self.animationView.frame.size.height);
        [UIView animateWithDuration:0.2 animations:^{
            self.animationView.center = self.center;
        }];
}

- (void)dampingAnimation{
    //弹性动画 参数：持续时间，延迟时间，阻尼系数，初始速度
    self.animationView.frame = CGRectMake(0, 0, self.animationView.frame.size.width, self.animationView.frame.size.height);
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.animationView.center = self.center;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)keyframeAnimation{
    //    关键帧动画(中间可以添加合适多的帧来做不同的衔接动画),relativeDuration:表示这个关键帧动画占用整个动画时长的百分比
     self.animationView.frame = CGRectMake(0, 0, self.animationView.frame.size.width, self.animationView.frame.size.height);
        [UIView animateKeyframesWithDuration:3.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.4 animations:^{
                self.animationView.center = self.center;
                }];
            [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.4 animations:^{
                self.animationView.bounds = CGRectMake(0, 0, 100, 100);
            }];
        } completion:^(BOOL finished) {
    
        }];
}


@end
