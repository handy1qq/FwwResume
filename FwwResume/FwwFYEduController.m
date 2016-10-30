//
//  FwwFYEduController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/23.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwFYEduController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface FwwFYEduController ()
@property (strong, nonatomic) IBOutlet UILabel *schLabel;
@property (strong, nonatomic) IBOutlet UILabel *proLabel;
@property (strong, nonatomic) IBOutlet UILabel *eduLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *githubLabel;

@end

@implementation FwwFYEduController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.navigationItem.leftBarButtonItem = [ [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"night_icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [self setUI];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI {
    self.schLabel.text = @"学校:吉林大学珠海学院";
    [UIView animateWithDuration:2.0 animations:^{
        self.schLabel.transform = CGAffineTransformMakeTranslation(-330, 230);
    }];
    self.proLabel.text = @"专业:电子信息科学与技术";

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            self.proLabel.transform = CGAffineTransformMakeTranslation(370, 280);
        }];
    });
    
    
    
    self.eduLabel.text = @"学历:本科";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            self.eduLabel.transform = CGAffineTransformMakeTranslation(-330,-370);
        }];
    });
    
    self.timeLabel.text = @"毕业时间:2016年6月";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            self.timeLabel.transform = CGAffineTransformMakeTranslation(470,-320);
        }];
    });
}
@end
