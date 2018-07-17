//
//  menuItem.m
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "menuItem.h"

@implementation menuItem
-(instancetype)initMenuItemWithName:(NSString *)name withDesc:(NSString *)desc withVegetarain:(NSInteger)isVege withPrice:(CGFloat)price{
    if (self == [super init]) {
        self.name = name;
        self.desc = desc;
        _isVegetarain = isVege;
        self.price = price;
        
    }
    
    return self;
}

-(CGFloat)getPrice{
    return self.price;
}

-(NSString *)getDescription{
    return self.desc;
}

-(NSString *)getName{
    return self.name;
}

-(BOOL)isIsVegetarain{
    return self.isVegetarain;
}

-(void)print{
    NSLog(@"菜品名称：%@ | 菜品价格：%f | 菜品描述：%@ | 是否是素菜：%@" ,self.name, self.price, self.desc, self.isVegetarain ? @"是":@"不是");
}

@end
