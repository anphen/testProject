//
//  ViewController.m
//  TestFlowLayout
//
//  Created by zhaoxu on 2017/5/17.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+SNFoundation.h"
#import "DefineConstant.h"
#import "UIColor+SNFoundation.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(self.view.width *0.5, self.view.width *0.5 * 1.2);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    _collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:flowLayout];
    _collectView.delegate = self;
    [_collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reuseIdentifier"];
    _collectView.dataSource = self;
    [self.view addSubview:self.collectView];
    _collectView.backgroundColor = kColorWithHexString(@"f2f2f2");
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.contentView.backgroundColor = kRandomColor;
    return cell;
}


@end
