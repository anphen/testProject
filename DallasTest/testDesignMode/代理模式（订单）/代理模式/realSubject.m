//
//  realSubject.m
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "realSubject.h"

@implementation realSubject

-(NSString *)getSex{
    return self.sex;
}

-(NSString *)getName{
    return self.name;
    
}

-(NSInteger)getAge{
    return self.age;
}


-(NSString *)getAddress{
    return self.address;
}


-(NSString *)getCountry{
    return self.country;
}


@end
