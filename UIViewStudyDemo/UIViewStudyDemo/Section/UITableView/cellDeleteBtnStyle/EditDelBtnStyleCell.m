//
//  EditDelBtnStyleCell.m
//  UIViewStudyDemo
//
//  Created by maliang on 16/7/17.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "EditDelBtnStyleCell.h"

@implementation EditDelBtnStyleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *subView in self.subviews)
    {
        if (X(subView) >= WIDTH(self))
        {
            for (UIView *childView in subView.subviews)
            {
                if ([childView isKindOfClass:[UIButton class]])
                {
                    UIButton *delBtn = (UIButton *)childView;
                    [delBtn setBackgroundColor:[UIColor orangeColor]];
                    [delBtn setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
//                    UIView *myView = [[UIView alloc] initWithFrame:childView.bounds];
//                    myView.backgroundColor = [UIColor redColor];
//                    [childView addSubview:myView];
                    break;
                }
            }
        }
    }
}

@end
