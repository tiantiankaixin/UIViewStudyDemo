//
//  CollectionViewIndexViewController.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "CollectionViewIndexViewController.h"
#import "FlowLayoutViewController.h"
#import "SelectCellScaleViewController.h"
#import "DianXinShopViewController.h"

@interface CollectionViewIndexViewController ()

@end

@implementation CollectionViewIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configureDataSource];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"UICollectionView"];
}

- (void)configureDataSource
{
    [self addARowWithCellTitle:@"FlowLayout" vcClass:[FlowLayoutViewController class] turnType:M_push];
    [self addARowWithCellTitle:@"选中的cell放大" vcClass:[SelectCellScaleViewController class] turnType:M_push];
    [self addARowWithCellTitle:@"电信商城页展示效果" vcClass:[DianXinShopViewController class] turnType:M_push];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
