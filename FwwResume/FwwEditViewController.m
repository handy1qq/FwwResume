//
//  FwwEditViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/28.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwEditViewController.h"
#import "FwwNote.h"

@interface FwwEditViewController ()
@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextView *contentText;

@end

@implementation FwwEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleText.text = self.note.title;
    self.contentText.text = self.note.content;
    self.titleText.enabled = NO;
    self.contentText.userInteractionEnabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.titleText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self.contentText];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存并返回" style:UIBarButtonItemStyleDone target:self action:@selector(save)];


    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange
{
    //    self.navigationItem.rightBarButtonItem.enabled = (self.titleText.text.length > 0 || self.contentText.text.length > 0);
}


- (void)save {
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(editViewController:didSavaContact:)]) {
        self.note.title = self.titleText.text;
        self.note.content = self.contentText.text;
        
        [self.delegate editViewController:self didSavaContact:self.note];
    }
}

- (IBAction)edit:(UIBarButtonItem *)item {
    if (self.titleText.enabled) {  //点击'取消
        self.titleText.enabled = NO;
        self.contentText.userInteractionEnabled =NO;
        [self.view endEditing:YES];
        item.title = @"编辑";
        self.titleText.text = self.note.title;
        self.contentText.text = self.note.content;
    }else {  //点击'编辑'
        self.titleText.enabled = YES;
        self.contentText.userInteractionEnabled = YES;
        [self.contentText becomeFirstResponder];
        item.title = @"取消";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
