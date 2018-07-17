//
//  ViewController.m
//  testRunTime
//
//  Created by zhaoxu on 2018/1/22.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "runtimeTitleCell.h"
#import "ViewController+runtime.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    self.dataArray = @[@"发送消息", @"交换方法实现", @"拦截系统方法", @"分类中添加属性", @"获取一个类的所有成员变量和类型", @"获取所有属性来重写归档解档方法", @"动态添加方法"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    runtimeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCellIdentiFier" forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 第一种跳转
    //   UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle     mainBundle]]instantiateViewControllerWithIdentifier:@"staticTB"];
    //   [self.navigationController pushViewController:vc animated:YES];
    
    //第二种跳转
//    [self performSegueWithIdentifier:@"staticTBIdentifier" sender:self];
    switch (indexPath.row) {
        case 0:
        {
            [self msgSent];
        }
            break;
        case 1:
        {
            [self exchangeImp];
        }
            break;
        case 2:
        {
            NSLog(@" func = ViewController+zx_viewDidLoad");
        }
            break;
        case 3:
        {
            self.vcName = @"namenamename";
            NSLog(@"==========%@==========", self.vcName);
        }
            break;
        case 4:
        {
            [self printPersonProAndType];
        }
            break;
        case 5:
        {
            [self archivePerson];
        }
            break;
        case 6:
        {
            [self addMethod];
        }
            break;

        default:
            break;
    }
    
}

//进行赋值操作
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     NSLog(@"%s", __func__);
}

//用于拦截非 performSegueWithIdentifier segue 跳转
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

- (IBAction)backMainView:(UIStoryboardSegue *)segue{
     NSLog(@"%s", __func__);
}

@end
