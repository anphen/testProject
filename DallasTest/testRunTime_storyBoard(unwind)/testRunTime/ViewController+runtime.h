//
//  ViewController+runtime.h
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (runtime)


@property (nonatomic, copy) NSString *vcName;

- (void)msgSent;

- (void)exchangeImp;

- (void)printPersonProAndType;

- (void)archivePerson;

- (void)addMethod;

@end
