//
//  MainMenuViewController.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "MainMenuViewController.h"
#import "CollectionViewIndexViewController.h"
#import "TalbleViewIndex.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configureDataSource];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"主页"];
}

- (void)configureDataSource
{
    [self addARowWithCellTitle:@"UICollectionView" vcClass:[CollectionViewIndexViewController class] turnType:M_push];
    [self addARowWithCellTitle:@"UITableView" vcClass:[TalbleViewIndex class] turnType:M_push];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
