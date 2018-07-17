//
//  ViewController.m
//  装饰者模式和category
//
//  Created by Mia on 16/11/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Transform.h"
#import "UIImage+Shadow.h"
#import "ImageTransformFilter.h"
#import "ImageShadowFilter.h"
#import "DecoratorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"Image.png"];
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI / 4.0);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width / 2.0,image.size.height / 8.0);
    CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
    
// 方法一：使用装饰者模式实现
    //这里传入image没有报错，是因为uiimage类遵循了imageComponet协议，见UIImage+ImageComponent分类
    id <ImageComponent> transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image transform:finalTransform];
    id <ImageComponent> finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
    
    
    
//方法二：使用category实现
//    UIImage *transformedImage = [image imageWithTransform:finalTransform];
//    id <ImageComponent> finalImage = [transformedImage imageWithDropShadow];
    
    //上面两句可以合并为下面的一句
//    id <ImageComponent> finalImage = [[image imageWithTransform:finalTransform] imageWithDropShadow];
    
    
    
    DecoratorView *decoratorView = [[DecoratorView alloc] initWithFrame:[self.view bounds]];
    [decoratorView setImage:(UIImage *)finalImage];
    [self.view addSubview:decoratorView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
