//
//  ImageShadowFilter.h
//  Decorator
//
//  Created by Carlo Chung on 11/30/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//


//具体装饰器，实现阴影效果
#import <Foundation/Foundation.h>
#import "ImageFilter.h"

@interface ImageShadowFilter : ImageFilter
{

}

- (void) apply;

@end
