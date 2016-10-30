//
//  FwwMessageViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/29.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwMessageViewController.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD+MJ.h"
#import "FwwLoginViewCell.h"
#import "FwwMessageViewCell.h"

@interface FwwMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation FwwMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setFootBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFootBtn
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 140)];
    //view.backgroundColor = [UIColor redColor];
    
    
    UIButton *footerBtn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 20;
    footerBtn1.frame = CGRectMake(10, 20, width, 50);
    footerBtn1.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:177.0/255.0 blue:223.0/255.0 alpha:1];
    [footerBtn1 setTitle:@"意见反馈" forState:UIControlStateNormal];
    footerBtn1.tintColor = [UIColor whiteColor];
    [view addSubview:footerBtn1];
   // [footerBtn1 addTarget:self action:@selector(feedBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *footerBtn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    footerBtn2.frame = CGRectMake(10, 80, width, 50);
    footerBtn2.backgroundColor = [UIColor colorWithRed:56.0/255.0 green:177.0/255.0 blue:223.0/255.0 alpha:1];
    [footerBtn2 setTitle:@"清理缓存" forState:UIControlStateNormal];
    footerBtn2.tintColor = [UIColor whiteColor];
    [view addSubview:footerBtn2];
    [footerBtn2 addTarget:self action:@selector(clean) forControlEvents:UIControlEventTouchUpInside];
    //self.tableView.tableFooterView = [ [UIView alloc] init];
    self.tableview.tableFooterView = view;
}


- (void)clean {
    NSUInteger imageSize = [ [SDImageCache sharedImageCache] getSize];
    // 缓存路径
    //    NSFileManager *mgr = [NSFileManager defaultManager];
    //    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //    NSUInteger byteSize = [caches fileSize];
    double size = imageSize / 1000.0 / 1000.0;
    NSString *cachesSize = [NSString stringWithFormat:@"缓存大小为 %0.1fM",size];
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:cachesSize message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"清理" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ [SDImageCache sharedImageCache] clearDisk];
        [MBProgressHUD showSuccess:@"清理成功"];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [aler addAction:cancelAction];
    [aler addAction:action];
    [self presentViewController:aler animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        return 3;
    }
}

//这个方法返回指定的 section的footer view 的高度。
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

////   这个方法返回指定的 row 的高度。
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 60;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FwwLoginViewCell *cell = [FwwLoginViewCell cellWithTableView:tableView];
        //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        cell.imageView.image = [UIImage imageNamed:@"tab_icon_personal_normal"];
        cell.userName.text = @"登录";
    
        return cell;
    } else {
        FwwMessageViewCell *cell = [FwwMessageViewCell  cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.textmessage.text = @"电话";
            cell.imageView.image = [UIImage imageNamed:@"phone-icon"];
            cell.number.text = @"11111111";
        } else if (indexPath.row == 1) {
            cell.textmessage.text = @"邮箱";
            cell.imageView.image = [UIImage imageNamed:@"email"];
            cell.number.text = @"845519359@qq.com";
        } else {
            cell.textmessage.text = @"QQ";
            cell.imageView.image = [UIImage imageNamed:@"qq_3d"];
            cell.number.text = @"845519359";
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
