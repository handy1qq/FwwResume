//
//  FwwCollectionViewCell.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FwwProject;

@interface FwwCollectionViewCell : UICollectionViewCell
/**fwwproject */
@property (strong, nonatomic) FwwProject *project;
@end
