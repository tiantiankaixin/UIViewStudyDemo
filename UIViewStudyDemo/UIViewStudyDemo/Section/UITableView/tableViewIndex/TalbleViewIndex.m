//
//  TalbleViewIndex.m
//  UIViewStudyDemo
//
//  Created by maliang on 16/7/17.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "TalbleViewIndex.h"
#import "CellDelBtnStyleEdit.h"

@interface TalbleViewIndex ()

@end

@implementation TalbleViewIndex

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configureDataSource];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    [self setCenterItemWithTitle:@"UITableView"];
}

- (void)configureDataSource
{
    [self addARowWithCellTitle:@"修改cell删除按钮样式" vcClass:[CellDelBtnStyleEdit class] turnType:M_push];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
