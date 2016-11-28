//
//  TableTextViewController.m
//  UIViewStudyDemo
//
//  Created by mal on 16/10/9.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "TableTextViewController.h"
#import "TextViewCell.h"

@interface TableTextViewController ()<UITableViewDelegate,UITableViewDataSource,TextViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation TableTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TextViewCell" bundle:nil] forCellReuseIdentifier:@"TextViewCell"];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextViewCell"];
    cell.delegate = self;
    return cell;
}

- (void)uploadCellWithHeight:(CGFloat)cellHeight
{
//    self.cellHeight = cellHeight + 20;
//    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
