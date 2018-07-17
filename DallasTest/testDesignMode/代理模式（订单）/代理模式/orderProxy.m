//
//  orderProxy.m
//  代理模式
//
//  Created by Mia on 16/11/29.
//  Copyright © 2016年 Mia. All rights reserved.
//

#import "orderProxy.h"


@interface orderProxy()
@property(strong,nonatomic)order * ord;
@end

static NSInteger orderQueryCount;

@implementation orderProxy
- (instancetype)initWithOrder:(order* )order
{
    self.ord = order;
    return self;
}

//-(void)changeProductName:(NSString *)productName operator:(NSString *)opreator{
//    if([opreator isEqualToString:self.ord.orderOperator]){
//        NSLog(@"修改订单成功");
//        [self.ord changeProductName:productName operator:opreator];
//    }else{
//        NSLog(@"你无权操作该订单");
//    }
//}



//-(void)queryOrder{
//    orderQueryCount ++;
//    NSLog(@"订单被查询%zd次", orderQueryCount);
//    [self.ord queryOrder];
//    
//}



-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if([self.ord respondsToSelector:aSelector] ){
        return [self.ord methodSignatureForSelector:aSelector];
    }else{
        return [super methodSignatureForSelector:aSelector];
    }
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    NSString *selName = NSStringFromSelector(anInvocation.selector);
    
    if([self.ord respondsToSelector:anInvocation.selector] &&  [selName isEqualToString:@"changeProductName:operator:"]){
        NSString *opreator ;
        [anInvocation getArgument:&opreator atIndex:3];//self和_cmd分别是参数0和1，所有后面的参数index从2开始，这里取的是operator参数，index=3
        if([opreator isEqualToString:self.ord.orderOperator]){
            NSLog(@"修改订单成功");
            [anInvocation invokeWithTarget:self.ord];
        }else{
            NSLog(@"你无权操作该订单");
        }
    }else if ([self.ord respondsToSelector:anInvocation.selector] &&  [selName isEqualToString:@"queryOrder"]){
        orderQueryCount ++;
        NSLog(@"订单被查询%zd次", orderQueryCount);
        [anInvocation invokeWithTarget:self.ord];
    }
    else{
        [super forwardInvocation:anInvocation];
    }
    
}

@end
