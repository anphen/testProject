//
//  ViewController.m
//  testTimer
//
//  Created by zhaoxu on 2017/6/13.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSTimer *nstimer;

@property (nonatomic, strong) dispatch_source_t gcdtTimer;

@property (nonatomic) CADisplayLink *displayLink;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)nstimerTest:(id)sender {
    
    [self nstimerStart];
}


- (IBAction)gcdtimerTest:(id)sender {
    [self gcdtimerStart];
}


- (IBAction)catimerTest:(id)sender {
    
    [self catimerStart];
}

- (void)timerAction{
    self.count++;
    NSLog(@"===== %li =====", (long)self.count);
}

- (void)invalidTimer{
    [self gcdtimetInvalid];
    [self catimerInvalid];
    [self nstimerInvalid];
}


#pragma mark - catimer
- (void)catimerStart{
    [self invalidTimer];
    self.count = 0;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerAction)];
    self.displayLink.preferredFramesPerSecond = 1;
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)catimerInvalid{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - gcd tier

- (void)gcdtimerStart{
    [self invalidTimer];
    self.count = 0;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        [self timerAction];
    });
    dispatch_resume(timer);
    self.gcdtTimer = timer;
}
- (void)gcdtimetInvalid{
    if (self.gcdtTimer) {
        dispatch_source_cancel(self.gcdtTimer);
        self.gcdtTimer = nil;
    }
}

#pragma mark - nstimer
- (void)nstimerStart{
    self.count = 0;
    [self invalidTimer];
    self.nstimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.nstimer forMode:NSRunLoopCommonModes];
    
}

- (void)nstimerInvalid{
    [self.nstimer invalidate];
    self.nstimer = nil;
}

@end
