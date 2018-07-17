//
//  TransitionAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/7.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "TransitionAnimationView.h"

@implementation TransitionAnimationView

- (void)configAnimation{
    [super configAnimation];
    self.animationView.bounds = CGRectMake(0, 0, 200, 300);
    self.animationView.center = CGPointMake(self.center.x, self.center.y - 100);
    self.operateArray = @[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose"];
}

- (void)operateAction:(UIButton *)btn
{
    self.animationView.backgroundColor = kRandomColor;
    CATransition *transition = [[CATransition alloc]init];
    transition.duration = 1.0;
    transition.subtype = kCATransitionFromTop;
    switch (btn.tag) {
        case 0:
        {
            transition.type  = kCATransitionFade;
        }
            break;
        case 1:
        {
            transition.type  = kCATransitionMoveIn;
        }
            break;
        case 2:
        {
            transition.type  = kCATransitionPush;
        }
            break;
        case 3:
        {
            transition.type  = kCATransitionReveal;
        }
            break;
        case 4:
        {
            transition.type  = @"cube";
        }
            break;
        case 5:
        {
             transition.type  = @"suckEffect";
        }
            break;
        case 6:
        {
             transition.type  = @"oglFlip";
        }
            break;
        case 7:
        {
            transition.type  = @"rippleEffect";
        }
            break;
        case 8:
        {
            transition.type  = @"pageCurl";
        }
            break;
        case 9:
        {
             transition.type  = @"pageUnCurl";
        }
            break;
        case 10:
        {
            transition.type  = @"cameraIrisHollowOpen";
        }
            break;
        case 11:
        {
            transition.type  = @"cameraIrisHollowClose";
        }
            break;
            
        default:
            break;
    }
    [self.animationView.layer addAnimation:transition forKey:@"transition"];

}

@end
