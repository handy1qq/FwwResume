//
//  FwwMessageViewCell.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/29.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwMessageViewCell.h"

@implementation FwwMessageViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"messageCell";
    FwwMessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [ [ [NSBundle mainBundle] loadNibNamed:@"Fwwmessage" owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
