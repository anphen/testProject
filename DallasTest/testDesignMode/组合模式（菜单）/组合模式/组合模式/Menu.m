//
//  Menu.m
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "Menu.h"

@implementation Menu
-(instancetype)initMenuItemWithName:(NSString *)name withDesc:(NSString *)desc{
    if (self == [super init]) {
        self.name = name;
        self.desc = desc;
        self.menuComponentArr = [NSMutableArray array];
        
    }
    
    return self;
}

-(NSString *)getDescription{
    return self.desc;
}

-(NSString *)getName{
    return self.name;
}


-(void)add:(MenuComponent *)component{
    [self.menuComponentArr addObject:component];
}

-(void)remove:(MenuComponent *)component{
    [self.menuComponentArr enumerateObjectsUsingBlock:^(MenuComponent * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj == component){
            [self.menuComponentArr removeObject:component];
        }else{
            if ([obj isKindOfClass:[Menu class]]) {
                if ([((Menu *)obj).menuComponentArr containsObject:component]) {
                    [obj remove:component];
                    }
                }
            }
    }];
    
    
}


-(MenuComponent*)getChild:(NSInteger)position{
    return self.menuComponentArr[position];
}


-(void)print{
    NSLog(@"菜单名称：%@ | 菜单描述：%@ " ,self.name, self.desc);
    if(self.menuComponentArr.count){
        for (MenuComponent * component in self.menuComponentArr) {
            [component print];
        }
    }
}


@end
