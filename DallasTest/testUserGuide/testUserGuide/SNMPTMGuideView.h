//
//  SNMPTMGuideView.h
//  testUserGuide
//
//  Created by zhaoxu on 2018/2/12.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBlock)(void);

@interface SNMPTMGuideView : UIView

@property (nonatomic, assign) NSInteger myIndex;//default 5,tab 中 我的 位置
@property (nonatomic, assign) NSInteger fuliIndex;//default 4,tab 中 福利 位置

@property (nonatomic, assign) NSInteger tabAllCount;//default 5

/**
 初始化方法
 
 @param view 父视图
 @param appCallBack 显示回调
 @param disAppCallBack 消失回调,hiddenGuideView也会调用
 @param skipCallBack 跳过回调
 @return 实例对象
 */
+ (SNMPTMGuideView *)showGuideInView:(UIView *)view appearCallBack:(voidBlock)appCallBack disAppearCallBack:(voidBlock)disAppCallBack skipCallBack:(voidBlock)skipCallBack;

- (void)hiddenGuideView;

@end
