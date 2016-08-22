//
//  AutoLayoutIndex.m
//  UIViewStudyDemo
//
//  Created by mal on 16/8/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "AutoLayoutIndex.h"
#import "MasontyViewController.h"

@interface AutoLayoutIndex ()

@end

@implementation AutoLayoutIndex

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configureDataSource];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    [self.navigationItem setTitle:@"AutoLayout"];
}

- (void)configureDataSource
{
    [self addARowWithCellTitle:@"Masonry的基本使用" vcClass:[MasontyViewController class] turnType:M_push];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
