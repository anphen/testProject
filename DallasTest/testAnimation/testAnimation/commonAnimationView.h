//
//  commonAnimationView.h
//  testAnimation
//
//  Created by zhaoxu on 2017/4/1.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface commonAnimationView : UIView

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, strong) NSArray *operateArray;

- (void)beginAnimation;

- (void)configAnimation;

- (void)operateAction:(UIButton *)btn;

@end
