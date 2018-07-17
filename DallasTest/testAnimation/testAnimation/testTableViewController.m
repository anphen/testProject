//
//  testTableViewController.m
//  testAnimation
//
//  Created by zhaoxu on 2017/4/1.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "testTableViewController.h"
#import "testChildViewController.h"

NSArray *viewClassStringArray;

@interface testTableViewController ()

@end

@implementation testTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    viewClassStringArray = @[@"SimpleAnimationView",
                             @"AffineAnimationView",
                             @"BaseAnimationView",
                             @"keyFrameAnimationView",
                             @"GroupAnimationView",
                             @"TransitionAnimationView"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return viewClassStringArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
    UILabel *label = [cell viewWithTag:1000];
    label.text = viewClassStringArray[indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    testChildViewController *testChildVC = [segue destinationViewController];
    testChildVC.animationViewType = indexPath.row;
}

@end
