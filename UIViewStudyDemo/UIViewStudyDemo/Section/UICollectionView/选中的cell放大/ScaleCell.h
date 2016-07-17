//
//  ScaleCell.h
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaleCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle_LB;

- (void)setCellWithIndexPath:(NSIndexPath *)path;

@end
