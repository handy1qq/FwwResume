//
//  FwwMessageViewCell.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/29.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FwwMessageViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UILabel *textmessage;
@property (strong, nonatomic) IBOutlet UILabel *number;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
