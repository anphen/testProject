//
//  ZXNavigationController.m
//  testNaviPop
//
//  Created by zhaoxu on 2017/6/13.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ZXNavigationController.h"

@interface ZXNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation ZXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重载pop push
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

//防止push时时间冲突，push是禁止pop手势
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //设置返回按钮
    if (self.viewControllers.count > 0) {
        //显示返回按钮
//        viewController.navigationItem.leftBarButtonItem = [self backButtonItem];
    }
    [super pushViewController:viewController animated:animated];
}

//转场动画结束，启用pop手势
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - UIGestureRecognizerDelegate
//第一个控制器不响应侧滑手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.childViewControllers count] == 1) {
        return NO;
    }
    return YES;
}

//是否同时响应多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

//解决在手指滑动时候,被pop的viewController中的UIscrollView会跟着一起滚动
//这个方法返回YES，第一个和第二个互斥时，第二个会失效
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

//这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0){
//   
//}


@end
