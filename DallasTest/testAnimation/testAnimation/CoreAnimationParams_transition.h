//
//  CoreAnimationParams_transition.h
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#ifndef CoreAnimationParams_transition_h
#define CoreAnimationParams_transition_h
ype：动画过渡类型

Apple 官方的SDK其实只提供了四种过渡效果。
- kCATransitionFade 渐变效果
- kCATransitionMoveIn 进入覆盖效果
- kCATransitionPush 推出效果
- kCATransitionReveal 揭露离开效果
私有API提供了其他很多非常炫的过渡动画，比如@”cube”、@”suckEffect”、@”oglFlip”、 @”rippleEffect”、@”pageCurl”、@”pageUnCurl”、@”cameraIrisHollowOpen”、@”cameraIrisHollowClose”等。
注意点
私有api，不建议开发者们使用。因为苹果公司不提供维护，并且有可能造成你的app审核不通过。

subtype：动画过渡方向

kCATransitionFromRight 从右侧进入
kCATransitionFromLeft 从左侧进入
kCATransitionFromTop 从顶部进入
kCATransitionFromBottom 从底部进入
startProgress：动画起点(在整体动画的百分比)
endProgress：动画终点(在整体动画的百分比)

#endif /* CoreAnimationParams_transition_h */
