//
//  SelectCellScaleViewController.m
//  UIViewStudyDemo
//
//  Created by wangtian on 16/4/26.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "SelectCellScaleViewController.h"
#import "ScaleCell.h"

#define SelectCellScale_Identifier   @"SelectCellScale_Identifier"

@interface SelectCellScaleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SelectCellScaleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"中间的cell放大"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ScaleCell" bundle:nil] forCellWithReuseIdentifier:SelectCellScale_Identifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SelectCellScale_Identifier forIndexPath:indexPath];
    [cell setCellWithIndexPath:indexPath];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
