//
//  ViewController.m
//  testHitTest
//
//  Created by zhaoxu on 2017/6/5.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "superSCView.h"
#import "childView.h"
#import "Masonry.h"
#import "DefineConstant.h"

float interval = 30.0;
@interface ViewController ()<UIScrollViewDelegate>
{
     float lastContentOffset;
}
@property (weak, nonatomic) IBOutlet superSCView *superVC;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (nonatomic, copy) NSString *direction;
@property (nonatomic, strong) NSArray *itemArray;

@property (nonatomic, strong) NSMutableArray *childViewArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentSizeWidth;

@property (nonatomic, assign) BOOL isDrag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isDrag = NO;
    lastContentOffset = 0;
    self.superVC.scrollView = self.mainScrollView;
    self.mainScrollView.delegate = self;
    self.childViewArray = [NSMutableArray array];
    self.itemArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"8",@"10",@"11"];
    [self creatChildView];
}

- (void)creatChildView{
    float childViewWidth  = kScreenWidth - 30 - 15 - interval;
    self.contentSizeWidth.constant = childViewWidth * self.itemArray.count+(self.itemArray.count ) * interval;
    self.mainScrollView.contentSize = CGSizeMake(childViewWidth * self.itemArray.count+(self.itemArray.count - 1) * interval, 0);
    for (int i = 0; i<self.itemArray.count; i++) {
        childView *chidV = [[childView alloc]init];
        chidV.index = i;
        chidV.frame = CGRectMake(i * (interval+childViewWidth ) , 20, childViewWidth, self.mainScrollView.frame.size.height -40);
        [self.childViewArray addObject:chidV];
        [self.mainScrollView addSubview:chidV];
        if (i == 1) {
            chidV.transform = CGAffineTransformMakeScale(1.1, 1.1);
            chidV.scale = 1.1;
        }
    }
    [self.mainScrollView setContentOffset:CGPointMake(kScreenWidth - 30 - 15, 0) animated:NO];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _isDrag = YES;
    lastContentOffset = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _isDrag = NO;
    if (ceil( scrollView.contentOffset.x / (kScreenWidth - 30 - 15))  == 11) {
        [scrollView setContentOffset:CGPointMake((kScreenWidth - 30 - 15), 0) animated:NO];
//        [self recoverTransform];
        childView *v1 = self.childViewArray[1];
        v1.transform = CGAffineTransformMakeScale(1.1, 1.1);
        v1.scale = 1.1;
        
        childView *v11 = self.childViewArray[11];
        v11.transform = CGAffineTransformMakeScale(1, 1);
        v11.scale = 1;
    }
    if (scrollView.contentOffset.x / (kScreenWidth - 30 - 15)  == 0) {
        [scrollView setContentOffset:CGPointMake((kScreenWidth - 30 - 15) * 10, 0) animated:NO];
//        [self recoverTransform];
        childView *v10 = self.childViewArray[10];
        v10.transform = CGAffineTransformMakeScale(1.1, 1.1);
        v10.scale = 1.1;
        
        childView *v0 = self.childViewArray[0];
        v0.transform = CGAffineTransformMakeScale(1, 1);
        v0.scale = 1;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSString *direction = @"";
    if (lastContentOffset < scrollView.contentOffset.x) {
        direction = @"向左";
    }else{
        direction = @"向右";
    }
    if (_isDrag) {
        [self scaleViewWithDirection:direction];
    }
    lastContentOffset = scrollView.contentOffset.x;
}


- (void)scaleViewWithDirection:(NSString *)direction{
    if ([direction isEqualToString:@"向左"]) {
        NSInteger index = self.mainScrollView.contentOffset.x / self.mainScrollView.frame.size.width;
        if (index + 1 >= self.itemArray.count || index < 0) {
            return;
        }
        childView *currentView = self.childViewArray[index];
        childView *nextView = self.childViewArray[index +1];
        CGFloat distance = self.mainScrollView.contentOffset.x - lastContentOffset;
        CGFloat scale = 0.1 * distance / self.mainScrollView.frame.size.width;
        currentView.transform = CGAffineTransformMakeScale(currentView.scale -scale, currentView.scale -scale);
        currentView.scale = currentView.scale - scale;
        nextView.transform = CGAffineTransformMakeScale( nextView.scale +scale, nextView.scale +scale);
        nextView.scale = nextView.scale + scale;
    }
    
    if ([direction isEqualToString:@"向右"]) {
         NSInteger index = self.mainScrollView.contentOffset.x / self.mainScrollView.frame.size.width + 1;
        if (index >= self.itemArray.count || index < 0) {
            return;
        }
        childView *currentView = self.childViewArray[index];
        childView *nextView = self.childViewArray[index - 1];
        CGFloat distance = self.mainScrollView.contentOffset.x - lastContentOffset;
        CGFloat scale = 0.1 * distance / self.mainScrollView.frame.size.width;
        currentView.transform = CGAffineTransformMakeScale(currentView.scale +scale, currentView.scale +scale);
        currentView.scale = currentView.scale + scale;
        nextView.transform = CGAffineTransformMakeScale(nextView.scale -scale, nextView.scale -scale);
        nextView.scale = nextView.scale - scale;
    }
}

@end
