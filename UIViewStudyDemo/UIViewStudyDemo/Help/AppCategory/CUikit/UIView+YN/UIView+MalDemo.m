//
//  UIView+MalDemo.m
//  UIViewStudyDemo
//
//  Created by mal on 16/8/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "UIView+MalDemo.h"

@implementation UIView (MalDemo)

+ (UIView *)mal_viewWithColor:(UIColor *)color
{
    UIView *view = [[UIView alloc] init];
    if (color)
    {
        view.backgroundColor = color;
    }
    return view;
}

@end
