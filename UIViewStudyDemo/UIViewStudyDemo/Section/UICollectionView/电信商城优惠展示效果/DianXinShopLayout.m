//
//  DianXinShopLayout.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "DianXinShopLayout.h"

#define Item_Size CGSizeMake(220, 320)
#define Rotaion   M_PI / 4
#define RowMargin 5.0

@implementation DianXinShopLayout

-(id)init
{
    self = [super init];
    if (self)
    {
        self.itemSize = Item_Size;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(100, 10.0, 100, 10.0);//上下边距
        self.minimumLineSpacing = RowMargin;//行间距
    }
    return self;
}

//当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

//布局属性
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    //取父类的UICollectionViewLayoutAttributes
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    //可视rect
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    CGFloat centerX = visibleRect.origin.x + visibleRect.size.width / 2;
    //设置item的旋转
    for (UICollectionViewLayoutAttributes* attributes in array)
    {
        if (CGRectIntersectsRect(attributes.frame, rect))
        {
            CGFloat distance = centerX - attributes.center.x;//item到中心点的距离
//            if (ABS(distance) <= Item_Size.width + RowMargin)
//            {
                CGFloat progress = distance / (Item_Size.width + RowMargin);
                attributes.transform3D = [self transformWithProgress:progress];
//            }
        }
    }
    return array;
}

- (CATransform3D)transformWithProgress:(CGFloat)progress
{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0 / -900;
    //绕y轴旋转
    t1 = CATransform3DRotate(t1, Rotaion * progress, 0, 1, 0);
    return t1;
}

//对齐到网格
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //proposedContentOffset是没有对齐到网格时本来应该停下的位置
    
    //计算出实际中心位置
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    //取当前屏幕中的UICollectionViewLayoutAttributes
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    
    //返回调整好的point
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}


@end
