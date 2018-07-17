//
//  ImageTransformFilter.h
//  Decorator
//
//  Created by Carlo Chung on 11/30/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

//具体装饰者，实现仿射变换

#import <Foundation/Foundation.h>
#import "ImageFilter.h" 

@interface ImageTransformFilter : ImageFilter

@property (nonatomic, assign) CGAffineTransform transform;

- (id) initWithImageComponent:(id <ImageComponent>)component 
                    transform:(CGAffineTransform)transform;
- (void) apply;

@end
