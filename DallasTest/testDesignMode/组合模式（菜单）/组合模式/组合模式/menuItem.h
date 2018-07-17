//
//  menuItem.h
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "MenuComponent.h"

@interface menuItem : MenuComponent
@property(copy ,nonatomic)NSString *name;
@property(copy ,nonatomic)NSString *desc;
@property(assign,nonatomic)NSInteger isVegetarain;
@property(assign,nonatomic)CGFloat price;

-(instancetype)initMenuItemWithName:(NSString*)name withDesc:(NSString*)desc withVegetarain:(NSInteger)isVege withPrice:(CGFloat)price;

@end
