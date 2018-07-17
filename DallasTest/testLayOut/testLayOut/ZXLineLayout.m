//
//  ZXLineLayout.m
//  testLayOut
//
//  Created by zhaoxu on 2017/6/7.
//  Copyright © 2017年 Suning. All rights reserved.
//

#import "ZXLineLayout.h"

@implementation ZXLineLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.itemSize = CGSizeMake(345,100);
//        self.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 30);
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds

{
    NSLog(@"====%s====", __func__);
    return YES;
}

- (void)prepareLayout
{
    NSLog(@"====%s====", __func__);
    [super prepareLayout];
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"====%s====", __func__);
    return [super layoutAttributesForItemAtIndexPath:indexPath];
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"====%s====", __func__);
    return [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"====%s====", __func__);
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"====%s====", __func__);
        CGRect visiableRect;
    visiableRect.size = CGSizeMake(self.collectionView.frame.size.width + 30, self.collectionView.frame.size.height);
    visiableRect.origin = self.collectionView.contentOffset;
    // 1.取得默认的cell的UICollectionViewLayoutAttributes
    NSArray *array = [super layoutAttributesForElementsInRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width + 30, rect.size.height)];
    // 计算屏幕最中间的x
    CGFloat itemWidth = 315;
    CGFloat centerX = self.collectionView.contentOffset.x + itemWidth * 0.5;
    // 2.遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 如果不在屏幕上,直接跳过
        if (!CGRectIntersectsRect(visiableRect, attrs.frame)) continue;
        
        // 每一个item的中点x
        CGFloat itemCenterX = attrs.center.x;
        
        // 差距越小, 缩放比例越大
        // 根据跟屏幕最中间的距离计算缩放比例
        CGFloat scale = 1 - 0.1 * ABS(itemCenterX - centerX) / 345;
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }

    return array;
    
//    NSArray *array = [super layoutAttributesForElementsInRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width + 100, rect.size.height)];
//    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    NSLog(@"====%s====", __func__);
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}
@end
