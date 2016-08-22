//
//  TextKitIndexViewController.m
//  UIViewStudyDemo
//
//  Created by mal on 16/8/22.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "TextKitIndexViewController.h"
#import "TextKitGeneral.h"

@interface TextKitIndexViewController ()

@end

@implementation TextKitIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"TextKitIndex"];
    [self addARowWithCellTitle:@"凸版印刷&文字环绕" vcClass:[TextKitGeneral class] turnType:M_push];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
