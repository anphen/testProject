//
//  ImageFilter.m
//  Decorator
//
//  Created by Carlo Chung on 11/30/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import "ImageFilter.h"


@implementation ImageFilter


- (id) initWithImageComponent:(id <ImageComponent>) component
{
  if (self = [super init])
  {
    // save an ImageComponent
    [self setComponent:component];
  }
  
  return self;
}

- (void) apply{}


//DecoratorView的drawRect方法被调用，然后调用UIImage的drawInRect方法，被此方法拦截，转发到子类的apply方法，加上了各种装饰器效果
//这是一种另类的装饰器效果实现，一般正宗的装饰器模式，是被装饰者和装饰者实现同一个接口的同一个方法，然后一层层包裹实现递归调用
- (id) forwardingTargetForSelector:(SEL)aSelector
{
  NSString *selectorName = NSStringFromSelector(aSelector);
  if ([selectorName hasPrefix:@"drawInRect"])
  {
    [self apply];
  }
  
  return self.component;
}




@end
