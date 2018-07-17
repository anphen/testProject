//
//  RemoteControl.h
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandInterface.h"

@interface RemoteControl : NSObject
@property(strong,nonatomic)id<CommandInterface> slot;

-(void)onButtonClickWithSlot:(NSInteger)slot;
-(void)offButtonClickWithSlot:(NSInteger)slot;
-(void)undoButtonClick;
-(void)undoAllOperation;

-(void)setCommandWithSlot:(NSInteger )slot onCommand:(id<CommandInterface>)onCommand offCommand:(id<CommandInterface>)offCommand;
@end
