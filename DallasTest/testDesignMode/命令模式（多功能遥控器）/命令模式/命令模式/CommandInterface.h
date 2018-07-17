//
//  CommandInterface.h
//  命令模式
//
//  Created by Mia on 16/11/1.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommandInterface <NSObject>

/**
 执行
 */
-(void)execute;

/**
 取消
 */
-(void)undo;

@end


