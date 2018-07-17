//
//  main.m
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDDriver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CDDriver *cd = [CDDriver new];
        [cd  readCD];

    }
    return 0;
}
