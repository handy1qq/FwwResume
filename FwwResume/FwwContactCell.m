//
//  FwwContactCell.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/27.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwContactCell.h"
#import "FwwNote.h"
@interface FwwContactCell()
@property (nonatomic, weak)UIView *divider;
@end

@implementation FwwContactCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:ID];
}

- (void)setNote:(FwwNote *)note {
    _note = note;
    self.textLabel.text = note.title;
    self.detailTextLabel.text = note.datetime;
}

//在使用IB的时候才会涉及到此方法的使用，当.nib文件被加载的时候，会发送一个awakeFromNib的消息到.nib文件中的每个对象，每个对象都可以定义自己的awakeFromNib函数来响应这个消息，执行一些必要的操作。
- (void)awakeFromNib {
    UIView *divider = [ [UIView alloc] init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    self.divider = divider;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat dividerX = 10;
    CGFloat dividerY = self.frame.size.height - 1;
    CGFloat dividerW = self.frame.size.width - 20;
    CGFloat dividerH = 1;
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
}

@end
