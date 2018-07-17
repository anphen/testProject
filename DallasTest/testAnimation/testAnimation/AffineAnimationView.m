//
//  AffineAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/7.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "AffineAnimationView.h"

@implementation AffineAnimationView

- (void)configAnimation
{
    [super configAnimation];
    self.animationView.center = self.center;
    self.operateArray = @[@"位移",@"缩放",@"旋转",@"组合",@"反转"];
}

- (void)operateAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            [self offsetAnimation];
        }
            break;
        case 1:
        {
            [self scaleAnimation];
        }
            break;
        case 2:
        {
            [self rotateAnimation];
        }
            break;
        case 3:
        {
            [self groupAnimation];
        }
            break;
        case 4:
        {
            [self reverAnimation];
        }
            break;
            
        default:
            break;
    }
}

- (void)offsetAnimation
{
    kLogFunction
    self.animationView.transform = CGAffineTransformIdentity;

    [UIView animateWithDuration:0.2 animations:^{
        self.animationView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];
}

- (void)scaleAnimation
{
    kLogFunction
    self.animationView.transform = CGAffineTransformIdentity;

    [UIView animateWithDuration:0.4 animations:^{
        self.animationView.transform = CGAffineTransformMakeScale(2, 5);
    }];
}

- (void)rotateAnimation
{
    kLogFunction
    self.animationView.transform = CGAffineTransformIdentity;

    [UIView animateWithDuration:0.4 animations:^{
        self.animationView.transform = CGAffineTransformMakeRotation(M_PI );
    }];
}

- (void)groupAnimation
{
    kLogFunction
    self.animationView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        self.animationView.transform = CGAffineTransformTranslate(transform2, 100, 100);
    }];

}

- (void)reverAnimation
{
    kLogFunction
    self.animationView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0 animations:^{
        self.animationView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
    }];
}

- (void)beginAnimation
{
    kLogFunction
}


@end
