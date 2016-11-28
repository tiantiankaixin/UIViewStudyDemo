//
//  TextViewCell.m
//  UIViewStudyDemo
//
//  Created by mal on 16/10/9.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import "TextViewCell.h"

@implementation TextViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.textView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    // Initialization code
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"])
    {
        CGSize newSize = [[change objectForKey:@"new"] CGSizeValue];
        CGRect frame = self.textView.bounds;
        frame.size.height = newSize.height;
        self.textView.bounds = frame;
        [self.delegate uploadCellWithHeight:newSize.height];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
