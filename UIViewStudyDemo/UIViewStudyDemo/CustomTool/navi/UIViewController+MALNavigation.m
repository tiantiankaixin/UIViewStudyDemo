//
//  UIViewController+MALNavigation.m
//  MALHelp
//
//  Created by wangtian on 15/5/7.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "UIViewController+MALNavigation.h"

#define CenterItemColor [UIColor blackColor] //中间item颜色
#define SideItemColor   [UIColor blackColor]//两侧item颜色
#define SideItemFont   [UIFont systemFontOfSize:17]        //左右item 字体格式
#define CenterItemFont [UIFont systemFontOfSize:20]        //中间item 字体格式

@implementation UIViewController (MALNavigation)

- (CustomBarItem *)setItemWithTitle:(NSString *)title textColor:(UIColor *)color font:(UIFont *)font itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithTitle:title textColor:color font:font itemType:type];
    [item setItemWithNavigationItem:self.navigationItem itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithImage:(NSString *)imageName size:(CGSize)size itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithImage:imageName size:size type:type];
    [item setItemWithNavigationItem:self.navigationItem itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithCustomView:(UIView *)customView itemType:(ItemType)type
{
    CustomBarItem *item = [CustomBarItem itemWithCustomeView:customView type:type];
    [item setItemWithNavigationItem:self.navigationItem itemType:type];
    return item;
}

- (CustomBarItem *)setLeftItemWithTitle:(NSString *)title
{
    return [self setItemWithTitle:title textColor:SideItemColor font:SideItemFont itemType:left];
}

- (CustomBarItem *)setCenterItemWithTitle:(NSString *)title
{
    return [self setItemWithTitle:title textColor:CenterItemColor font:CenterItemFont itemType:center];
}

- (CustomBarItem *)setRightItemWithTitle:(NSString *)title
{
    return [self setItemWithTitle:title textColor:SideItemColor font:SideItemFont itemType:right];
}
#pragma mark - 设置返回按钮颜色
+  (void)setBackItemTextColor:(UINavigationController *)naviVC itemColor:(UIColor *)color
{
    [naviVC.navigationBar setTintColor:color];
}

#pragma mark - 设置导航栏背景图片
+ (void)setNavigationBarBgImage:(UINavigationController *)naviVC andBgImage:(UIImage *)bgImage
{
    [naviVC.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    naviVC.navigationBar.translucent = YES;
}

- (void)setNaviBarHidden
{
   [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}


@end
