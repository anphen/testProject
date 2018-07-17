//
//  TableViewController1.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "TableViewController1.h"

@interface TableViewController1 ()

@end

@implementation TableViewController1
- (IBAction)unwind:(id)sender {
    [self performSegueWithIdentifier:@"unwindIdentifier" sender:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//执行 segue之前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __func__);
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

//unwindSegue 源 VC即将跳转时调用
- (void)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
     NSLog(@"%s", __func__);
}

@end
