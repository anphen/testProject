//
//  Menu.h
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "MenuComponent.h"

@interface Menu : MenuComponent
@property(copy ,nonatomic)NSString *name;
@property(copy ,nonatomic)NSString *desc;
@property(strong,nonatomic)NSMutableArray<MenuComponent *>* menuComponentArr;

-(instancetype)initMenuItemWithName:(NSString*)name withDesc:(NSString*)desc;
@end
