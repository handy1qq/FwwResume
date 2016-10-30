//
//  FwwIntroController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwIntroController.h"
#import <UIKit/UIKit.h>
#import "UICountingLabel.h"

@interface FwwIntroController ()

@end

@implementation FwwIntroController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICountingLabel *myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(50, 230, 280, 45)];
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.font = [UIFont fontWithName:@"Avenir Next" size:48];
    myLabel.textColor = [UIColor colorWithRed:236/255.0 green:66/255.0 blue:43/255.0 alpha:1];
    //设置格式
    myLabel.format = @"%d 分";
    //设置变化范围及动画时间
    [myLabel countFrom:0
                    to:100
          withDuration:1.0f];
    [self.view addSubview:myLabel];
    
    
    UILabel *label = [ [UILabel alloc] init];
    label.frame = CGRectMake(70, 100, 200, 180);
    label.text = @"认真学习,对新知识好奇心强,做事努力做到:";
    label.numberOfLines = 0;
    label.preferredMaxLayoutWidth = 20;
    [self.view addSubview:label];
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
