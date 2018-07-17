
//
//  CoreAnimationParams.h
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#ifndef CoreAnimationParams_h
#define CoreAnimationParams_h
常用属性
duration : 动画的持续时间
beginTime : 动画的开始时间
repeatCount : 动画的重复次数
autoreverses : 执行的动画按照原动画返回执行
timingFunction : 控制动画的显示节奏系统提供五种值选择，分别是：
    kCAMediaTimingFunctionLinear 线性动画
    kCAMediaTimingFunctionEaseIn 先慢后快（慢进快出）
    kCAMediaTimingFunctionEaseOut 先块后慢（快进慢出）
    kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
    kCAMediaTimingFunctionDefault 默认，也属于中间比较快

delegate ： 动画代理。能够检测动画的执行和结束。
@interface NSObject (CAAnimationDelegate)
- (void)animationDidStart:(CAAnimation *)anim;
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
@end

path：关键帧动画中的执行路径

type ： 过渡动画的动画类型，系统提供了四种过渡动画。
- kCATransitionFade 渐变效果
- kCATransitionMoveIn 进入覆盖效果
- kCATransitionPush 推出效果
- kCATransitionReveal 揭露离开效果
subtype : 过渡动画的动画方向
- kCATransitionFromRight 从右侧进入
- kCATransitionFromLeft 从左侧进入
- kCATransitionFromTop 从顶部进入
- kCATransitionFromBottom 从底部进入

#endif /* CoreAnimationParams_h */
