//
//  CDPlayerOffCommand.h
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDPlayer.h"
#import "CommandInterface.h"

@interface CDPlayerOffCommand : NSObject<CommandInterface,NSCoding>
@property(strong,nonatomic)CDPlayer *player;
-(instancetype)initWithPlayer:(CDPlayer *)player;
@end
