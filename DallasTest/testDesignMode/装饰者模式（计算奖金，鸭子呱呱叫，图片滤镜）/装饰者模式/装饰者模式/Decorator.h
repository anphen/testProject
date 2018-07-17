//
//  Decorator.h
//  装饰者模式
//
//  Created by Mia on 16/12/14.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "component.h"

@interface Decorator : component
@property(strong,nonatomic)component *components;
- (instancetype)initWithComponet:(component *)component;
@end
