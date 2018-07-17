//
//  XMLBuilder.m
//  建造者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "XMLBuilder.h"

@interface XMLBuilder()
@property(nonatomic,strong)NSMutableString *data;

@end


@implementation XMLBuilder

- (instancetype)initWithData:(NSString *)data
{
    self = [super init];
    if (self) {
        self.data = [[NSMutableString alloc]initWithString:data];
    }
    return self;
}

-(void)buildHeader{
    [self.data insertString:@"\n<xml.headr>\n<body>\n" atIndex:0];
}

-(void)buildBody{
    [self.data appendString:@"\n<\\body>\n"];
}

-(void)builFooter{
    [self.data appendString:@"<xml.footer>"];
}
-(NSString *)getProduct{
    return self.data;
}


@end
