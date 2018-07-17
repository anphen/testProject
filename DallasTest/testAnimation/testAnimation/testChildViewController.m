//
//  testChildViewController.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/1.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "testChildViewController.h"
#import "commonAnimationView.h"
#import "baseAnimationView.h"
#import "keyFrameAnimationView.h"
#import "GroupAnimationView.h"

extern NSArray *viewClassStringArray;

@interface testChildViewController ()

@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic, strong)  commonAnimationView *commonAnimationView;

@end

@implementation testChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self showView];
}

- (void)showView{
    self.commonAnimationView = [self getAnimationViewWithClassSting:viewClassStringArray[self.animationViewType]];
    self.commonAnimationView.backgroundColor = kRandomColor;
    [self.animationView addSubview:self.commonAnimationView];
}

- (commonAnimationView *)getAnimationViewWithClassSting:(NSString *)classString{
    return [[NSClassFromString(classString) alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 44 - 64)];
}

- (void)setAnimationViewType:(AnimationViewType)animationViewType{
    _animationViewType = animationViewType;
    self.title = viewClassStringArray[animationViewType];
}

- (IBAction)beginAnimation:(id)sender {
    [self.commonAnimationView beginAnimation];
}

@end
