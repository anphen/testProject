//
//  bulierInterface.h
//  建造者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

@protocol bilerInterface <NSObject>

-(void)buildHeader;
-(void)buildBody;
-(void)builFooter;

-(NSString*)getProduct;

@end
