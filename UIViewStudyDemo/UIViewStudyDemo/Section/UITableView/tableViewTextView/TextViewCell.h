//
//  TextViewCell.h
//  UIViewStudyDemo
//
//  Created by mal on 16/10/9.
//  Copyright © 2016年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextViewCellDelegate <NSObject>

- (void)uploadCellWithHeight:(CGFloat)cellHeight;

@end

@interface TextViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, weak) id<TextViewCellDelegate> delegate;

@end
