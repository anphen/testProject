//
//  RemoteLoader.h
//  命令模式
//
//  Created by Mia on 16/12/3.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemoteControl.h"

@interface RemoteLoader : NSObject
- (instancetype)initWithRm:(RemoteControl*)RM;
@end
