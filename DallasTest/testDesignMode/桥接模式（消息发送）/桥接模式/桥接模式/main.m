//
//  main.m
//  桥接模式
//
//  Created by Mia on 16/12/15.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "messageImplement.h"
#import "messageSMS.h"
#import "messageEmail.h"
#import "messageMobile.h"
#import "abstractMessage.h"
#import "commonMessage.h"
#import "urgencyMessage.h"
#import "specialUrgencyMessage.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        id<messageImplement> messageIMP = [messageMobile new];
        abstractMessage *message = [[specialUrgencyMessage alloc]initWithImplement:messageIMP];
        NSMutableString *mStr = [[NSMutableString alloc]initWithString:@"大海啊，全是水，骏马啊，四条腿"];
        [message send:mStr];
    }
    return 0;
}
