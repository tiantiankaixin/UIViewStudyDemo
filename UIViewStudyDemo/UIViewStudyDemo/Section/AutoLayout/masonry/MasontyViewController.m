//
//  MasontyViewController.m
//  UIViewStudyDemo
//
//  Created by mal on 16/8/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "MasontyViewController.h"

@interface MasontyViewController ()
{
    UIView *_redView;
}

@end

@implementation MasontyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Masonry基础使用"];
    UIView *centerView = [UIView mal_viewWithColor:[UIColor redColor]];
    [self.view addSubview:centerView];
    _redView = centerView;
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        //make.size.equalTo(self.view).multipliedBy(0.5);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIView *view1 = [UIView mal_viewWithColor:[UIColor orangeColor]];
    [centerView addSubview:view1];
    UIView *view2 = [UIView mal_viewWithColor:[UIColor yellowColor]];
    [centerView addSubview:view2];
    CGFloat padding = 10;
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(centerView);
        make.left.equalTo(centerView).offset(padding);
        make.right.equalTo(view2.mas_left).offset(-padding);
        make.height.equalTo(centerView).offset(-padding * 2);
        make.width.equalTo(view2);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(centerView);
        make.left.equalTo(view1.mas_right).offset(padding);
        make.right.equalTo(centerView).offset(-padding);
        make.height.equalTo(view1);
        make.width.equalTo(view1);
        make.width.mas_equalTo(10);
    }];
    
    UILabel *testLB = [[UILabel alloc] init];
    testLB.backgroundColor = [UIColor redColor];
    testLB.text = @"test label";
    [self.view addSubview:testLB];
    [testLB mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.top.equalTo(self.view).offset(10);
        make.right.lessThanOrEqualTo(self.view).offset(-10);
    }];
}

- (IBAction)updateCons
{
    [_redView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    [UIView animateWithDuration:0.5f animations:^{
        
        [_redView layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
