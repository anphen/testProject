//
//  SNMPTMGuideView.m
//  testUserGuide
//
//  Created by zhaoxu on 2018/2/12.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "SNMPTMGuideView.h"
#import "Masonry.h"

@interface SNMPTMGuideView()

@property (nonatomic, copy) voidBlock appCallBack;
@property (nonatomic, copy) voidBlock disAppCallBack;
@property (nonatomic, copy) voidBlock skipCallBack;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) CALayer *firstLayer;
@property (nonatomic, strong) CALayer *secondLayer;
@property (nonatomic, strong) CALayer *ThirdLayer;

@property (nonatomic, assign) NSInteger currentindex;

@property (nonatomic, strong) UIImageView *guideImageView;

@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation SNMPTMGuideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _myIndex = 5;
        _fuliIndex = 4;
        _currentindex = 1;
        _tabAllCount = 5;
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.8;
        _guideImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, frame.size.height - 215 * 0.5 -  frame.size.width*(360.0/750.0) , frame.size.width, frame.size.width*(360.0/750.0))];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick)];
        [_bgView addGestureRecognizer:tap];
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_skipButton setImage:[UIImage imageNamed:@"sntm_sign_guide_close"] forState:UIControlStateNormal];
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_skipButton setTitle:@" 跳过引导" forState:UIControlStateNormal];
        [_skipButton setBackgroundColor:[UIColor clearColor]];
        _skipButton.frame = CGRectMake(frame.size.width - 93, 236/2, 93, 16);
        [_skipButton addTarget:self action:@selector(skipGuide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgView];
        [self addSubview:_guideImageView];
        [self addSubview:_skipButton];
        [self layerFirst];
    }
    return self;
}

- (void)skipGuide{
    [self removeFromSuperview];
    if (self.skipCallBack) {
        self.skipCallBack();
    }
}

- (void)layerFirst{
    self.guideImageView.image = [UIImage imageNamed:@"snmptm_guide1"];
    if (self.firstLayer) {
        [self.bgView.layer setMask:self.firstLayer];
    }
    else{
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bgView.frame];
        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, self.frame.size.height - 49, self.frame.size.width, 49) cornerRadius:0]bezierPathByReversingPath]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        self.firstLayer = shapeLayer;
        [self.bgView.layer setMask:self.firstLayer];
    }
}

- (void)layerSecond{
    self.guideImageView.image = [UIImage imageNamed:@"snmptm_guide2"];
    if (self.secondLayer) {
        [self.bgView.layer setMask:self.secondLayer];
    }
    else{
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bgView.frame];
        CGFloat singleWidth = self.bgView.frame.size.width / self.tabAllCount;
        [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(singleWidth * 0.5 * ((self.fuliIndex - 1)*2 + 1) , self.bgView.frame.size.height - 49 * 0.5) radius:50 startAngle:0 endAngle:2*M_PI clockwise:NO]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        self.secondLayer = shapeLayer;
        [self.bgView.layer setMask:self.secondLayer];
    }
}

- (void)layerThird{
    self.guideImageView.image = [UIImage imageNamed:@"snmptm_guide3"];
    if (self.ThirdLayer) {
        [self.bgView.layer setMask:self.ThirdLayer];
    }
    else{
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bgView.frame];
        CGFloat singleWidth = self.bgView.frame.size.width / self.tabAllCount;
        [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(singleWidth * 0.5 * ((self.myIndex - 1)*2 + 1), self.bgView.frame.size.height - 49 * 0.5) radius:50 startAngle:0 endAngle:2*M_PI clockwise:NO]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        self.ThirdLayer = shapeLayer;
        [self.bgView.layer setMask:self.ThirdLayer];
    }
}

- (void)sureTapClick{
    switch (self.currentindex) {
        case 1:
        {
            [self.firstLayer removeFromSuperlayer];
            [self layerSecond];
        }
            break;
        case 2:
        {
            [self.secondLayer removeFromSuperlayer];
            [self layerThird];
        }
            break;
        case 3:
        {
            [self hiddenGuideView];
        }
            break;
            
        default:
            break;
    }
    self.currentindex++;
}

+ (SNMPTMGuideView *)showGuideInView:(UIView *)view appearCallBack:(voidBlock)appCallBack disAppearCallBack:(voidBlock)disAppCallBack skipCallBack:(voidBlock)skipCallBack{
    SNMPTMGuideView *guideView = [[SNMPTMGuideView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    guideView.appCallBack = appCallBack;
    guideView.disAppCallBack = disAppCallBack;
    guideView.skipCallBack = skipCallBack;
    [view addSubview:guideView];
    if (guideView.appCallBack) {
        guideView.appCallBack();
    }
    return guideView;
}

- (void)hiddenGuideView{
    [self removeFromSuperview];
    if (self.disAppCallBack) {
        self.disAppCallBack();
    }
}

@end
