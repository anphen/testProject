//
//  IFactory.h
//  抽象工厂模式
//
//  Created by Mia on 16/11/22.
//  Copyright © 2016年 Mia. All rights reserved.
//
@class IUser;
@class IDepartment;

@protocol IFactory <NSObject>
@required
-(IUser*)createUser;
-(IDepartment *)createDepartment;

@end
