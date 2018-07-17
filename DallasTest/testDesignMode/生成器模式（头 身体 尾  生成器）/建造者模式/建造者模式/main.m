//
//  main.m
//  建造者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bulierInterface.h"
#import "bulierDirector.h"
#import "htmlBuilder.h"
#import "XMLBuilder.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        id<bilerInterface> bulider ;
        NSString *data = @"生产者模式使用实践";
        bulider =  [[htmlBuilder alloc]initWithData:data];
//        bulider = [[XMLBuilder alloc]initWithData:data];
        
        bulierDirector *director = [[bulierDirector alloc]initWithBulider:bulider];
        NSString *str = [director constructProduct];
        NSLog(@"%@", str);
    }
    return 0;
}
