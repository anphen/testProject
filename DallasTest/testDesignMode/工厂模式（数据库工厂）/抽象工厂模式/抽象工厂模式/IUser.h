//
//  IUser.h
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface IUser : NSObject
-(void)insert:(NSString *)user;
-(void)getUser;
@end
