//
//  MTableView.m
//  UIViewStudyDemo
//
//  Created by mal on 2017/11/16.
//  Copyright © 2017年 wangtian. All rights reserved.
//

#import "MTableView.h"

@implementation MTableView

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *subView in self.subviews)
    {
        if ([subView isKindOfClass:NSClassFromString(@"UISwipeActionPullView")])
        {
            subView.backgroundColor = [UIColor orangeColor];
            for (UIView *view in subView.subviews)
            {
                if ([view isKindOfClass:[UIButton class]])
                {
                    UIButton *btn = (UIButton *)view;
                    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
                    [btn setBackgroundColor:[UIColor orangeColor]];
                }
            }
        }
    }
}

@end
