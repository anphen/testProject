//
//  CoreAnimationParams_keyFrame.h
//  testAnimation
//
//  Created by zhaoxu on 2017/4/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#ifndef CoreAnimationParams_keyFrame_h
#define CoreAnimationParams_keyFrame_h

重要属性
values ： 就是上述的NSArray对象。里面的元素称为”关键帧”(keyframe)。动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
path ： 可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。如果你设置了path，那么values将被忽略。
keyTimes ： 可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧.当keyTimes没有设置的时候,各个关键帧的时间是平分的。

#endif /* CoreAnimationParams_keyFrame_h */
