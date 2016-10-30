//
//  FwwContactCell.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/27.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FwwNote;
@interface FwwContactCell : UITableViewCell
/**FwwNote */
@property (strong, nonatomic) FwwNote *note;
+(instancetype)cellWithTableView: (UITableView *)tableView;



@end
