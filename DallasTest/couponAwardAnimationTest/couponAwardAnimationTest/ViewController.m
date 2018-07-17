//
//  ViewController.m
//  couponAwardAnimationTest
//
//  Created by zhaoxu on 2017/12/12.
//  Copyright © 2017年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *animationContentVIew;

@property (nonatomic, strong) UIImageView *animationImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationContentVIew = [[UIView alloc]init];
    self.animationContentVIew.alpha = 0.4;
    self.animationContentVIew.backgroundColor = [UIColor blackColor];
    self.animationImageView = [[UIImageView alloc]init];
    self.animationImageView.image = [UIImage imageNamed:@"snmptm_sign_award_animation_1"];
    
    [self.view addSubview:self.animationContentVIew];
    [self.view addSubview:self.animationImageView];
    
    [self.animationContentVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(50);
        make.bottom.mas_equalTo(-50);
    }];
    
    [self.animationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.animationContentVIew.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(20);
        make.width.mas_equalTo(322);
        make.height.mas_equalTo(self.animationImageView.mas_width).multipliedBy(506/644.0);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
