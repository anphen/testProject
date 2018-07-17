//
//  bulierDirector.m
//  建造者模式
//
//  Created by Mia on 16/11/27.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "bulierDirector.h"
@interface bulierDirector()
@property(strong,nonatomic)id<bilerInterface> bulider;
@end

@implementation bulierDirector
- (instancetype)initWithBulider:(id<bilerInterface>)bulider
{
    self = [super init];
    if (self) {
        self.bulider = bulider;
    }
    return self;
}

-(NSString *)constructProduct{
    [self.bulider buildHeader];
    [self.bulider buildBody];
    [self.bulider builFooter];
    return  [self.bulider getProduct];
}
@end
