//
//  FwwInfoViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/23.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwInfoViewController.h"

@interface FwwInfoViewController ()

@end

@implementation FwwInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    //name
    UILabel *name = [ [UILabel alloc] initWithFrame:CGRectMake(90, 170, 119, 33) ];
    name.text = @"姓名:冯文伟";
    name.font = [UIFont systemFontOfSize:19];
    name.alpha = 0;
    [UIView animateWithDuration:2.0 animations:^{
        name.alpha =1.0;
    }];
    [self.view addSubview:name];
    
    //sexy
    UILabel *sexy = [ [UILabel alloc] initWithFrame:CGRectMake(90, 220, 119, 33) ];
    sexy.text = @"性别:男";
    sexy.font = [UIFont systemFontOfSize:19];
    sexy.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        sexy.alpha =1.0;
    }];
    [self.view addSubview:sexy];
    

    //age
    UILabel *age = [ [UILabel alloc] initWithFrame:CGRectMake(90, 270, 200, 33) ];
    age.text = @"出生日期:1991年12月";
    age.font = [UIFont systemFontOfSize:19];
    age.alpha = 0;
    [UIView animateWithDuration:4.0 animations:^{
        age.alpha =1.0;
    }];
    [self.view addSubview:age];
    
    //from
    UILabel *from = [ [UILabel alloc] initWithFrame:CGRectMake(90, 320, 200, 33) ];
    from.text = @"籍贯:广东惠州";
    from.font = [UIFont systemFontOfSize:19];
    from.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        from.alpha =1.0;
    }];
    [self.view addSubview:from];
    
    
    UILabel *github = [ [UILabel alloc] initWithFrame:CGRectMake(400, -100, 200, 33) ];
    github.text = @"个人github:handy1qq";
    github.font = [UIFont systemFontOfSize:19];
    github.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        github.alpha =1.0;
        github.transform = CGAffineTransformMakeTranslation(-310, 470);
    }];
    [self.view addSubview:github];
}


@end
