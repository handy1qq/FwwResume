//
//  FwwLoginViewCell.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/29.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FwwLoginViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
