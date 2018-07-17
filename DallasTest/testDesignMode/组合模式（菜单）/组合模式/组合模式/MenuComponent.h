//
//  MenuComponent.h
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuComponent : NSObject
-(void)add:(MenuComponent *)component;
-(void)remove:(MenuComponent *)component;
-(MenuComponent*)getChild:(NSInteger)position;
-(NSString*)getName;
-(NSString*)getDescription;
-(CGFloat)getPrice;
-(BOOL)isVegetarian;
-(void)print;
@end
