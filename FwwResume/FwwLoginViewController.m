//
//  FwwLoginViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/26.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwLoginViewController.h"
#import "MBProgressHUD+MJ.h"
#define AccountKey @"account"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"
#define AutoLoginKey @"auto_login"

@interface FwwLoginViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *accountField;
@property (strong, nonatomic) IBOutlet UITextField *pwdField;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
- (IBAction)rmbPwdChange;

- (IBAction)autoLogin;
@end

@implementation FwwLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.accountField.text = [defaults objectForKey:AccountKey];
    self.rmbPwdSwitch.on = [defaults boolForKey:RmbPwdKey];
    self.autoLoginSwitch.on = [defaults boolForKey:AutoLoginKey];
    if (self.rmbPwdSwitch.isOn) {
            self.pwdField.text = [defaults objectForKey:PwdKey];
    }
    if (self.autoLoginSwitch) {
         [self loginBtnClick];
    }
    [self textChange];

    
}

- (void)textChange
{
    self.loginBtn.enabled = (self.accountField.text.length > 0 && self.pwdField.text.length > 0);
}

- (IBAction)loginBtnClick {
    if ( ![self.accountField.text isEqualToString:@"123"] ) {
      
            [MBProgressHUD showError:@"账号错误，账号为:123"];
    
        
        return;
    }
    if ( ![self.pwdField.text isEqualToString:@"123"] ) {
        
           [MBProgressHUD showError:@"密码次错误，密码为123"];
        
        return;
    }
    [MBProgressHUD showMessage:@"登录中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];

        [self performSegueWithIdentifier:@"login2contacts" sender:nil];
        //存储数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.accountField.text forKey:AccountKey];
        [defaults setObject:self.pwdField.text forKey:PwdKey];
        [defaults setBool:self.rmbPwdSwitch.isOn forKey:RmbPwdKey];
        [defaults setBool:self.autoLoginSwitch.isOn forKey:AutoLoginKey];
        [defaults synchronize];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    vc.navigationItem.title = [NSString stringWithFormat:@"%@的日记",self.accountField.text];
}

- (IBAction)rmbPwdChange {
    if (self.rmbPwdSwitch.isOn == NO)
    {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLogin {
    if (self.autoLoginSwitch.isOn == YES)
    {
        [self.rmbPwdSwitch setOn:YES animated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
}


@end
