//
//  mainBoard.h
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mainBoard : NSObject
+(instancetype)shareInstance;

-(void)handleData:(NSMutableString *)data dataSource:(id)source;
@end
