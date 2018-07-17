//
//  EncodeTypeViewController.h
//  testUnicode
//
//  Created by zhaoxu on 2018/2/7.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EncodeTypeViewControllerDelegate <NSObject>

- (void)deSelectRow:(NSString *)text;

@end

@interface EncodeTypeViewController : UITableViewController

@property (nonatomic, weak) id<EncodeTypeViewControllerDelegate> delegate;

@end
