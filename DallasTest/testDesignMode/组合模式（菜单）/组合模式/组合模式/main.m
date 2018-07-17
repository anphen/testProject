//
//  main.m
//  组合和迭代模式
//
//  Created by Mia on 16/11/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "menuItem.h"
#import "Menu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MenuComponent *pancakeHouseMenu = [[Menu alloc]initMenuItemWithName:@"博饼屋菜单" withDesc:@"早餐"];
        MenuComponent *dinnerMenu = [[Menu alloc]initMenuItemWithName:@"正餐菜单" withDesc:@"午餐"];
        MenuComponent *cafeMenu = [[Menu alloc]initMenuItemWithName:@"咖啡菜单" withDesc:@"晚餐"];
        MenuComponent *dessertMenu = [[Menu alloc]initMenuItemWithName:@"甜点菜单" withDesc:@"饭后甜点"];
        MenuComponent *allMenu = [[Menu alloc]initMenuItemWithName:@"所有菜单" withDesc:@"所有菜单的组合"];
        
        [allMenu add:pancakeHouseMenu];
        [allMenu add:dinnerMenu];
        [allMenu add:cafeMenu];
        
        menuItem *meatItem = [[menuItem alloc]initMenuItemWithName:@"红烧肉" withDesc:@"祖传红烧肉，肥而不腻" withVegetarain:0 withPrice:177.2f];
        menuItem *fishItem = [[menuItem alloc]initMenuItemWithName:@"清蒸鲈鱼" withDesc:@"新鲜味美，回味无穷" withVegetarain:0 withPrice:2332.0f];
        [dinnerMenu add:meatItem];
        [dinnerMenu add:fishItem];
        
        menuItem *dessertItem1 = [[menuItem alloc]initMenuItemWithName:@"清炒小白菜" withDesc:@"味美而鲜，有机绿色无污染" withVegetarain:1 withPrice:17.3f];
        menuItem *dessertItem2 = [[menuItem alloc]initMenuItemWithName:@"玉米排骨汤" withDesc:@"饭后一口汤，快乐似神仙" withVegetarain:1 withPrice:243.3f];
        [dessertMenu add:dessertItem1];
        [dessertMenu add:dessertItem2];
        [dinnerMenu add:dessertMenu];
        

        [allMenu print];
        [allMenu remove:dessertMenu];
        
        NSLog(@"-------------------移除后的菜单--------------------------");
        [allMenu print];
        
        [dinnerMenu isVegetarian];


    }
    return 0;
}
