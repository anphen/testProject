//
//  ViewController.m
//  testPerformSelect
//
//  Created by zhaoxu on 2018/1/31.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)singleClick:(id)sender {
// 1   这种方式是在0.2秒内取消之前的点击事件，以做到防止多次点击。
//    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(buttonClick:) object:sender];
//    [self performSelector:@selector(buttonClick:) withObject:sender afterDelay:0.2f];
    
    
// 2   这种方式是在点击后设为不可被点击的状态，1秒后恢复
    self.button.enabled =NO;
    [self performSelector:@selector(recoverClick) withObject:nil afterDelay:1.0f];//防止重复点击
}

- (void)buttonClick{
    
}

- (void)recoverClick{
    self.button.enabled = YES;
}

- (IBAction)performAfterSec:(id)sender {
    
    //该方法会等待主线程 sleep结束才会执行
    [self performSelector:@selector(test0) withObject:nil afterDelay:3];
    
    //在子线程中无法调用selector方法这种情况是只有使用以下方法的时候才出现:
    //- (void)performSelector:(SEL)aSelector withObject:(id)arg afterDelay:(NSTimeInterval)delay;
    //1、afterDelay方式是使用当前线程的Run Loop中根据afterDelay参数创建一个Timer定时器在一定时间后调用SEL，NO AfterDelay方式是直接调用SEL。
 
    //2、子线程中默认是没有runloop的，需要手动创建，只要调用获取当前线程RunLoop方法即可创建。
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(test0) withObject:nil afterDelay:0];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"调用方法＝＝开始");
        sleep(5);
        NSLog(@"调用方法＝＝结束");
    });
    
    //使用dispatch_after在子线程上执行
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        [weakSelf test0];
    });
    
}

- (void)test0{
    NSLog(@"%s", __func__);
}

- (void)test1:(NSString *)param1{
     NSLog(@"%s, param1 = %@", __func__, param1);
}

- (void)test2:(NSString *)param1
       param2:(NSString *)param2{
    NSLog(@"%s, param1 = %@ , param2 = %@", __func__, param1, param2);
}

- (void)test3:(NSString *)param1
       param2:(NSString *)param2
       param3:(NSString *)param3{
    NSLog(@"%s, param1 = %@ , param2 = %@ , param3 = %@", __func__, param1, param2, param3);
}

- (IBAction)one:(id)sender{
    [self performSelector:@selector(test0)];
    [self performSelector:@selector(test1:) withObject:@"1111"];
}

- (IBAction)two:(id)sender {
    [self performSelector:@selector(test2:param2:) withObject:@"11111" withObject:@"22222"];
}

- (IBAction)some:(id)sender {
    
    //3:把多个参数封装成一个参数,比如可以把多个参数封装成NSDictionary，然后进行传递。
    
    //2 : objc_msgSend
    NSString *str = @"字符串objc_msgSend";
    NSNumber *num = @20;
    NSArray *arr = @[@"数组值1", @"数组值2"];
    SEL sel = NSSelectorFromString(@"ObjcMsgSendWithString:withNum:withArray:");
    //objc_msgSend(self, sel, str, num, arr);
    ((void (*) (id, SEL, NSString *, NSNumber *, NSArray *)) objc_msgSend) (self, sel, str, num, arr);
    return;
    
    //1:NSIvocation
    SEL select = @selector(test3:param2:param3:);
    [self perfromSel:@selector(test3:param2:param3:) arguments:@[@"111", @"222", @"333"]];
    //带参数方法
    //[self perfromSel:@selector(linkString1:s2:s3:) arguments:@[@"111", @"222", @"333"]];
    //return;
    return;
}

- (void)ObjcMsgSendWithString:(NSString *)string withNum:(NSNumber *)number withArray:(NSArray *)array {
    NSLog(@"%@, %@, %@", string, number, array[0]);
}


- (NSString *)linkString1:(NSString *)s1 s2:(NSString *)s2 s3:(NSString *)s3{
    NSLog(@"%s, param1 = %@ , param2 = %@ , param3 = %@", __func__, s1, s2, s3);
    return [[s1 stringByAppendingString:s2] stringByAppendingString:s3];
}

//多参数方法调用通用方法
- (id)perfromSel:(SEL)select arguments:(NSArray *)arguments{
    
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:select];
    if (!signature) {
        return nil;
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = select;
    
    NSInteger paramCount = invocation.methodSignature.numberOfArguments - 2;
    NSInteger useableParamCount = MIN(paramCount, arguments.count);
    for (int i = 0; i < useableParamCount; i++) {
        id param = arguments[i];
        [invocation setArgument:&param atIndex:i + 2];
    }
    
    [invocation invoke];
    
    id returnValue = nil;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}

@end
