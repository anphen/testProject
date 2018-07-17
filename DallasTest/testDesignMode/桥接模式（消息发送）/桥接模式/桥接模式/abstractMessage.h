//
//  abstractMessage.h
//  桥接模式
//
//  Created by Mia on 16/12/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "messageImplement.h"

@interface abstractMessage : NSObject
@property(strong,nonatomic)id<messageImplement> messageIm;

-(void)send:(NSMutableString*)message;
- (instancetype)initWithImplement:(id<messageImplement>)implement;
@end
