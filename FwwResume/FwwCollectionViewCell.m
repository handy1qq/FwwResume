//
//  FwwCollectionViewCell.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwCollectionViewCell.h"
#import "FwwProject.h"
@interface FwwCollectionViewCell()

@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation FwwCollectionViewCell

- (void)setProject:(FwwProject *)project {
    _project = project;
    self.iconView.image = [UIImage imageNamed:project.icon];
    self.titleLabel.text = project.title;
}

- (void)awakeFromNib {
    self.iconView.layer.cornerRadius = 8;
    self.iconView.clipsToBounds = YES;
    self.titleLabel.numberOfLines = 0;
    

}

@end
