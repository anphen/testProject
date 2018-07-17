//
//  subject.h
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

@protocol subject <NSObject>

-(NSString *)getName;
-(NSInteger)getAge;
-(NSString *)getSex;
-(NSString *)getAddress;
-(NSString *)getCountry;

//首次加载获取简单信息：name和sex
-(void)getSimpleInfo;
//当用户点击了某个人，去数据库获取该人的全部信息
-(void)getCompleteInfo;

@end
