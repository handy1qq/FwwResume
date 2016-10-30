//
//  FwwWorkingController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwWorkingController.h"

@interface FwwWorkingController ()

@end

@implementation FwwWorkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *working = [ [UILabel alloc] init];
    working.frame = CGRectMake(70, 100, 200, 180);
    working.text = @"2016年3月 实习公司:深圳华智融有限公司 职位:ios工程师 主要负责部分模块的开发";
    working.alpha = 0;
    working.numberOfLines = 0;
    working.preferredMaxLayoutWidth = 20;
    [UIView animateWithDuration:2.0 animations:^{
        working.alpha = 1;
    }];
    [self.view addSubview:working];
    self.navigationItem.leftBarButtonItem = [ [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"night_icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
