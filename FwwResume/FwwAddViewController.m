//
//  FwwAddViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/28.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwAddViewController.h"
#import "FwwNote.h"
#import "FwwEditViewController.h"
#import "FwwAddViewController.h"

@interface FwwAddViewController ()
@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextView *contentText;

@end

@implementation FwwAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.titleText];
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self.contentText];
    [self textChange];
}

- (void)textChange {
    self.navigationItem.rightBarButtonItem.enabled = self.titleText.text.length > 0 && self.contentText.text.length >0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.titleText becomeFirstResponder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [ [NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)add:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if ( [self.delegate respondsToSelector:@selector(addViewController:didAddContact:)] ) {
        FwwNote *note = [ [FwwNote alloc] init];
        note.title = self.titleText.text;
        note.content = self.contentText.text;
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [ [NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *currentDateString = [dateFormatter stringFromDate:date];
        note.datetime = currentDateString;
        [self.delegate addViewController:self didAddContact:note];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}


@end
