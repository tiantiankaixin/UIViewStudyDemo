//
//  ScaleCell.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "ScaleCell.h"

@implementation ScaleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithIndexPath:(NSIndexPath *)path
{
    if (path.row % 2 == 0)
    {
        self.imView.backgroundColor = [UIColor redColor];
    }
    else
    {
        self.imView.backgroundColor = [UIColor orangeColor];
    }
    self.cellTitle_LB.text = [NSString stringWithFormat:@"%ld",path.row];
}

@end
