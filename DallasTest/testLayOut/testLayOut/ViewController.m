//
//  ViewController.m
//  testLayOut
//
//  Created by zhaoxu on 2017/6/7.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "ZXLineLayout.h"
#import "HMImageCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat lastContentOffset;

@end

static NSString *const ID = @"image";


@implementation ViewController

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<=20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w - 30, 200);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[ZXLineLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    self.lastContentOffset = 0;
    [collectionView registerNib:[UINib nibWithNibName:@"HMImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.clipsToBounds = NO;
    
//    UISwipeGestureRecognizer * recognizerL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//    [recognizerL setDirection:(UISwipeGestureRecognizerDirectionRight)];
//    [self.collectionView addGestureRecognizer:recognizerL];
//    UISwipeGestureRecognizer * recognizerR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//    [recognizerR setDirection:(UISwipeGestureRecognizerDirectionLeft)];
//    [self.collectionView addGestureRecognizer:recognizerR];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recongnizer{
    
    CGFloat distance = 300 + 30;
    if (recongnizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.lastContentOffset>=(self.images.count- 1) * distance) {
            return;
        }
        [self.collectionView setContentOffset:CGPointMake(self.lastContentOffset + distance, 0) animated:YES];
        self.lastContentOffset = self.lastContentOffset + distance;
    }
    if (recongnizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.lastContentOffset<=0) {
            return;
        }
        [self.collectionView setContentOffset:CGPointMake(self.lastContentOffset - distance, 0) animated:YES];
        self.lastContentOffset = self.lastContentOffset  - distance;
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[ZXLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[ZXLineLayout alloc] init] animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 2;
//}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.row];
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 删除模型数据
//    [self.images removeObjectAtIndex:indexPath.item];
//    
//    // 删UI(刷新UI)
//    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
//}

//
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//     UICollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
//    reuseView.backgroundColor = [UIColor redColor];
//    return reuseView;
//}

@end
