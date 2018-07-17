//
//  ImageFilter.h
//  Decorator
//
//  Created by Carlo Chung on 11/30/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

//装饰者抽象类
#import <Foundation/Foundation.h>
#import "ImageComponent.h"
#import "UIImage+ImageComponent.h"

@interface ImageFilter : NSObject <ImageComponent>

@property (nonatomic, retain) id <ImageComponent> component;

- (void) apply;
- (id) initWithImageComponent:(id <ImageComponent>) component;

/*
// overridden methods in UIImage APIs
- (void) drawAsPatternInRect:(CGRect)rect; 
- (void) drawAtPoint:(CGPoint)point;
- (void) drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void) drawInRect:(CGRect)rect;
- (void) drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
 */

@end
