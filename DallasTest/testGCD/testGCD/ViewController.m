//
//  ViewController.m
//  testGCD
//
//  Created by zhaoxu on 2017/7/12.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#define logThread  NSLog(@"%@", [NSThread currentThread]);

@interface ViewController ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag - 1000) {
        case 0:
        {
            [self testDispath_after];
        }
            break;
        case 1:
        {
            [self testDispath_barrier];
        }
            break;
        case 2:
        {
            [self testDispathApply];
        }
            break;
        case 3:
        {
            [self testGroup];
        }
            break;
        case 4:
        {
            [self testSemapore];
        }
            break;
        case 5:
        {
            [self testSleep];
        }
            break;
        case 6:
        {
            [self testTimer];
        }
            break;
        case 7:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)testTimer{
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    __block NSInteger time = 1;
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"time = %li", (long)time);
//        time++;
//        if (time == 5) {
//            dispatch_cancel(timer);
//        }
//    });
//    dispatch_resume(timer);
//    self.timer = timer;
    
    
}


- (void)testDispath_barrier{
    dispatch_queue_t barrierQueue = dispatch_queue_create("barrier", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(barrierQueue, ^{
        for (int i =0; i< 100; i++) {
            NSLog(@"===== 1 + %i====== %@ ====", i, [NSThread currentThread]);
        }
    });
    
    dispatch_async(barrierQueue, ^{
        for (int i =0; i< 100; i++) {
            NSLog(@"===== 2 + %i====== %@ ====", i, [NSThread currentThread]);
        }
    });
    
    dispatch_barrier_async(barrierQueue, ^{
        NSLog(@"++++++++++++++++++++++++");
    });
    
    dispatch_async(barrierQueue, ^{
        for (int i =0; i< 100; i++) {
            NSLog(@"===== 3 + %i====== %@ ====", i, [NSThread currentThread]);
        }
    });

    dispatch_async(barrierQueue, ^{
        for (int i =0; i< 100; i++) {
            NSLog(@"===== 4 + %i====== %@ ====", i, [NSThread currentThread]);
        }
    });

}


- (void)testGroup{
    //方式一
    dispatch_queue_t testQueue = dispatch_queue_create("serial", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t testGroup = dispatch_group_create();
//    dispatch_group_enter(testGroup);
//    dispatch_async(testQueue, ^{
//        for (int i = 0; i< 100; i++) {
//            NSLog(@"====test1== %@ == index = %i ==", [NSThread currentThread],i);
//        }
//        dispatch_group_leave(testGroup);
//    });
//    
//    dispatch_group_enter(testGroup);
//    dispatch_async(testQueue, ^{
//        for (int i = 0; i< 100; i++) {
//            NSLog(@"====test2== %@ == index = %i ==", [NSThread currentThread],i);
//        }
//        dispatch_group_leave(testGroup);
//    });
//    dispatch_group_enter(testGroup);
//    dispatch_async(testQueue, ^{
//        for (int i = 0; i< 100; i++) {
//            NSLog(@"====test3== %@ == index = %i ==", [NSThread currentThread],i);
//        }
//        dispatch_group_leave(testGroup);
//    });
//    dispatch_group_notify(testGroup, testQueue, ^{
//        NSLog(@"++++++++++++++end++++++++++");
//    });
    
    //方式2
    dispatch_group_async(testGroup, testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test1== %@ == index = %i ==", [NSThread currentThread],i);
        }
    });
    
    dispatch_group_async(testGroup, testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test2== %@ == index = %i ==", [NSThread currentThread],i);
        }
    });
    
    dispatch_group_async(testGroup, testQueue, ^{
        for (int i = 0; i< 100; i++) {
            NSLog(@"====test3== %@ == index = %i ==", [NSThread currentThread],i);
        }
    });
    
    dispatch_group_notify(testGroup, testQueue, ^{
        NSLog(@"++++++++++++++end++++++++++");
    });
    
    dispatch_group_wait(testGroup, DISPATCH_TIME_FOREVER);
    NSLog(@"----end----");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"刷新主线程");
    });
}

- (void)testDispathApply{
    NSArray *dataArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    logThread
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_apply(dataArray.count, dispatch_get_global_queue(0, 0), ^(size_t i) {
            sleep(1);
            NSLog(@"=== %@ == i=%zu === %@ ===", [NSThread currentThread], i, dataArray[i]);
        });
        //apply执行完成执行
        NSLog(@"done");
    });
}

- (void)testSemapore{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_queue_create("semaphone", DISPATCH_QUEUE_CONCURRENT);
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i< 10; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            sleep(1);
            NSLog(@"%i %@ ", i, [NSThread currentThread]);
            [array addObject:[NSString stringWithFormat:@"%i", i]];
            dispatch_semaphore_signal(semaphore);
        });
    }
  

}

- (void)testSleep
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        logThread;
        sleep(10);
        NSLog(@"=======end=======");
    });
}

- (void)testDispath_after{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        logThread
    });
}

@end
