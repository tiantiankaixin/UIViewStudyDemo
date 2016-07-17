//
//  SelectCellScaleLayout.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "SelectCellScaleLayout.h"

static CGFloat cellMargin = 30;
#define ITEM_SIZE 120.0
#define AddScale  0.2

@interface SelectCellScaleLayout()

@property (nonatomic, strong) NSMutableArray *layoutArray;

@end

@implementation SelectCellScaleLayout

- (NSMutableArray *)layoutArray
{
    if (_layoutArray == nil)
    {
        _layoutArray = [[NSMutableArray alloc] init];
    }
    return _layoutArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    if (self.layoutArray.count == 0)
    {
        NSInteger rows = [self.collectionView numberOfItemsInSection:0];
        for (int i = 0; i < rows; i++)
        {
            NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
            attributes.center = CGPointMake(ITEM_SIZE / 2 + i * ITEM_SIZE + cellMargin * (i + 1), SCREEN_HEIGHT / 2);
            attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
            [self.layoutArray addObject:attributes];
        }
    }
}

//当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *returnArray = [NSMutableArray array];
    //可视rect
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    CGFloat centerX = visibleRect.origin.x + visibleRect.size.width / 2;
    for (UICollectionViewLayoutAttributes *attributes in self.layoutArray)
    {
        if (CGRectIntersectsRect(rect, attributes.frame))
        {
           CGFloat distance = centerX - attributes.center.x;//item到中心点的距离
            if (ABS(distance) <= ITEM_SIZE + cellMargin)
            {
                CGFloat scale = distance / (ITEM_SIZE + cellMargin);
                CGFloat zoomScale = 1 + AddScale * (1 - ABS(scale));
                attributes.transform3D = CATransform3DMakeScale(zoomScale, zoomScale, 1.0);//x,y轴方向变换
                attributes.zIndex = 1;
            }
           [returnArray addObject:attributes];
        }
    }
    return returnArray;
}

//对齐到网格
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //proposedContentOffset是没有对齐到网格时本来应该停下的位置
    if(proposedContentOffset.x == 0 || proposedContentOffset.x == self.collectionView.contentSize.width - WIDTH(self.collectionView))
    {
        return proposedContentOffset;
    }//保证第一个和最后一个可以完全看到
    
    //计算出实际中心位置
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    //取当前屏幕中的UICollectionViewLayoutAttributes
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, HEIGHT(self.collectionView) - 64);
    NSArray* array = [self layoutAttributesForElementsInRect:targetRect];
    
    //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    UICollectionViewLayoutAttributes *nearAtt = nil;
    for (UICollectionViewLayoutAttributes* layoutAttributes in array)
    {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment))
        {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
            nearAtt = layoutAttributes;
        }
    }
    if (nearAtt)
    {
       proposedContentOffset.x = nearAtt.center.x - targetRect.size.width / 2;
    }
    //返回调整好的point
    return CGPointMake(proposedContentOffset.x, proposedContentOffset.y);
}

- (CGSize)collectionViewContentSize
{
    NSInteger rows = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(ITEM_SIZE * rows + (rows + 1) * cellMargin, HEIGHT(self.collectionView) - 64);
}

@end
