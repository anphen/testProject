//
//  commonAnimationView.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/1.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "commonAnimationView.h"

CGFloat btnHeight = 30;
CGFloat btnInterVel = 10;

@implementation commonAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configAnimation];
        [self addSubview:self.animationView];
    }
    return self;
}


- (void)configAnimation{
    self.animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.animationView.backgroundColor = kRandomColor;
    [self addSubview:self.animationView];
}

- (void)beginAnimation{
    
}

- (void)setOperateArray:(NSArray *)operateArray{
    _operateArray = operateArray;
    [self configOperationView];
}

- (void)configOperationView{
    if (self.operateArray.count > 5) {
        [self configMoreBtn];
        return;
    }
    
    CGFloat btnWidth = (kScreenWidth - (self.operateArray.count + 1)*btnInterVel) / self.operateArray.count;
    for (int i = 0; i < self.operateArray.count; i++) {
        CGRect rect = CGRectMake((btnInterVel + btnWidth) * i + btnInterVel, self.frame.size.height - 40, btnWidth, btnHeight);
        UIButton *btn = [[UIButton alloc]initWithFrame:rect];
        btn.backgroundColor = [UIColor grayColor];
        [btn setTitle:self.operateArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i;
        [btn addTarget:self action:@selector(operateAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)configMoreBtn
{
     CGFloat btnWidth = (kScreenWidth - (5 + 1)*btnInterVel) / 5;
    NSInteger lineCount;
    if (self.operateArray.count % 5 == 0) {
        lineCount = self.operateArray.count / 5;
    }
    else{
         lineCount = self.operateArray.count / 5 + 1;
    }
    for (int i = 0; i < lineCount;  i ++ ) {
        for (int j = 0; j < 5; j ++) {
            if ((i * 5 + j + 1) > self.operateArray.count) {
                return;
            }
            CGRect rect = CGRectMake((btnInterVel + btnWidth) * j + btnInterVel, self.frame.size.height - 40 - 40 * (lineCount - i - 1), btnWidth, btnHeight );
            UIButton *btn = [[UIButton alloc]initWithFrame:rect];
            btn.backgroundColor = [UIColor grayColor];
            [btn setTitle:self.operateArray[i * 5 + j] forState:UIControlStateNormal];
            btn.tag = i * 5 + j;
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn addTarget:self action:@selector(operateAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
}

- (void)operateAction:(UIButton *)btn{

}

@end
