//
//  CollectionViewController.m
//  testCollectionView
//
//  Created by zhaoxu on 2016/12/30.
//  Copyright © 2016年 LT. All rights reserved.
//

#import "CollectionViewController.h"
#import "HeadCollectionReusableView.h"
#import "FootCollectionReusableView.h"

@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"testCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.allowsMultipleSelection = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:@"HeadCollectionReusableView" bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Head"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FootCollectionReusableView" bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Foot"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Head" forIndexPath:indexPath];
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
         reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Foot" forIndexPath:indexPath];
    }
    return reusableView;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//cell 将要显示
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//head or foot 将要显示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark <UICollectionViewDelegateFlowLayout>

//item size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(50, 50);
    }
    return CGSizeMake(100, 100);
}


//sectionhead size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
    
}

//sectionfoot size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 20);
}


/**
 * Section的上下左右边距--UIEdgeInsetsMake(上, 左, 下, 右);逆时针
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(50, 50, 50, 50);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//Section中每个Cell的上下边距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 5.0f;
    }
    return 20.0f;
}

//Section中每个Cell的上下边距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 5.0f;
    }
    return 20.0f;
}

@end
