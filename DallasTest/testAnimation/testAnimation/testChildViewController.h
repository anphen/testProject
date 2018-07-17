//
//  testChildViewController.h
//  testAnimation
//
//  Created by zhaoxu on 2017/4/1.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationViewType) {
    AnimationViewTypeSimple = 0,
    AnimationViewTypeAffine,
    AnimationViewTypeBase,
    AnimationViewTypeKeyFrame,
    AnimationViewTypeGroup,
    AnimationViewType5,
    AnimationViewType6,
    AnimationViewType7,
    AnimationViewType8,
    AnimationViewType9
};

@interface testChildViewController : UIViewController

@property (nonatomic, assign) AnimationViewType animationViewType;

@end
