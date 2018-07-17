//
//  CDPlayOnCommand.h
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandInterface.h"
#import "CDPlayer.h"

@interface CDPlayOnCommand : NSObject<CommandInterface,NSCoding>
@property(strong,nonatomic)CDPlayer *player;
-(instancetype)initWithPlayer:(CDPlayer *)player;
@end
