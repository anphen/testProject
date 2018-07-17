//
//  VideoCard.m
//  中介者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "VideoCard.h"

@implementation VideoCard

-(void )executeData:(NSMutableString *)data{
    [data appendString:@"+经过显卡处理"];
    NSLog(@"开始播放视频：“%@",data);
}

@end
