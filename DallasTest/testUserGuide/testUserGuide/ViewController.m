//
//  ViewController.m
//  testUserGuide
//
//  Created by zhaoxu on 2018/2/12.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "SNMPTMGuideView.h"

@interface ViewController ()

@property (nonatomic, strong) SNMPTMGuideView *guideView;

@end

@implementation ViewController

- (IBAction)showGuideView:(id)sender {
    
    self.guideView =  [SNMPTMGuideView showGuideInView:[UIApplication sharedApplication].keyWindow appearCallBack:^{
        
    } disAppearCallBack:^{
        
    } skipCallBack:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
