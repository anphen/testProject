//
//  CDPlayer.h
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDPlayer : NSObject
-(void)CDOn;
-(void)CDOff;
-(void)setVolume:(NSInteger)volume;
@end
