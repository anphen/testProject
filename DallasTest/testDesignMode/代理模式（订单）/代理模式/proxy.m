//
//  proxy.m
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "proxy.h"

@interface proxy()
@property(strong,nonatomic)realSubject *realSubject;
@property(assign,nonatomic)BOOL isReload;
@end

@implementation proxy
- (instancetype)initWithRealSubject:(realSubject *)subject
{
    self = [super init];
    if (self) {
        self.realSubject = subject;
    }
    return self;
}


-(NSString *)getSex{
   NSLog(@"性别：%@",[self.realSubject getSex]);
    return [self.realSubject getSex];
}

-(NSString*)getName{
    NSLog(@"名字：%@", [self.realSubject getName]);
    return [self.realSubject getName];

}

-(NSInteger)getAge{
    if (!self.isReload)
    {
        [self reloadDB];
    }
    NSLog(@"年龄：%zd", [self.realSubject getAge]);
    return [self.realSubject getAge];
}


-(NSString *)getAddress{
    if (!self.isReload)
    {
        [self reloadDB];
    }

   NSLog(@"地址：%@",[self.realSubject getAddress]);
    return [self.realSubject getAddress];

}


-(NSString *)getCountry{
    if (!self.isReload)
    {
        [self reloadDB];
    }

    NSLog(@"国家：%@",[self.realSubject getCountry]);
    return  [self.realSubject getCountry];

}

-(void)reloadDB{
    self.isReload = YES;
    //假设下面的数据是从数据库重新查询到的数据
    self.realSubject.age = 19;
    self.realSubject.address = @"泰坦星球";
    self.realSubject.country =  @"赛亚王国";
    
}

-(void)getSimpleInfo{
    NSLog(@"查询数据库获取简单数据....");
    self.realSubject.name = @"张三";
    self.realSubject.sex = @"男";
    [self getName];
    [self getSex];
}


-(void)getCompleteInfo{
    NSLog(@"重新查询数据库获取全部数据....");
    [self getName];
    [self getSex];
    [self getCountry];
    [self getAddress];
    [self getAge];
}

@end
