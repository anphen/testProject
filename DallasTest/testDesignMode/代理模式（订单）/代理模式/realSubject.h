//
//  realSubject.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "subject.h"

@interface realSubject : NSObject<subject>
//真实环境有几十条属性，这里为了方便只展示几条属性
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *country;


@end
