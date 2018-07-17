//
//  IUser.m
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "IUser.h"

@implementation IUser
-(void)insert:(NSString *)user{
    @throw ([NSException exceptionWithName:@"继承错误" reason:@"子类没有实现父类方法" userInfo:nil]);
}

-(void)getUser{
    @throw ([NSException exceptionWithName:@"继承错误" reason:@"子类没有实现父类方法" userInfo:nil]);
}
@end
