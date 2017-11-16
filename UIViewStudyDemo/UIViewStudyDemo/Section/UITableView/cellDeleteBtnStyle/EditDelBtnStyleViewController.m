//
//  CellDelBtnStyleEdit.m
//  UIViewStudyDemo
//
//  Created by maliang on 16/7/17.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "EditDelBtnStyleViewController.h"
#import "EditDelBtnStyleCell.h"
#import "MTableView.h"

@interface EditDelBtnStyleViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet MTableView *tableView;

@end

@implementation EditDelBtnStyleViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
}

- (void)setUpView
{
    self.title = @"修改cell删除按钮样式";
    for (int i = 0; i < 20; i++)
    {
        [self.dataSource addObject:[NSString stringWithFormat:@"范德萨发松岛枫松岛枫爽肤水的方式的方式发送到发送到发送到方式范德萨范德萨发%d",i]];
    }
    [self.tableView registerNib:[UINib nibWithNibName:@"EditDelBtnStyleCell" bundle:nil] forCellReuseIdentifier:@"EditDelBtnStyleCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditDelBtnStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditDelBtnStyleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.title_LB.text = self.dataSource[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"点击删除";
}

//- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (@available(iOS 11.0, *)) {
//        UIContextualAction *delAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删掉" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//            
//            
//            if (completionHandler)
//            {
//                completionHandler(YES);
//            }
//        }];
//        
//        return [UISwipeActionsConfiguration configurationWithActions:@[delAction]];
//    }
//    return nil;
//}

@end

