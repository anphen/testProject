//
//  proxy.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "subject.h"
#import "realSubject.h"

@interface proxy : NSObject<subject>
- (instancetype)initWithRealSubject:(realSubject *)subject;

@end
