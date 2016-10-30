//
//  FwwContactsViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/27.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwContactsViewController.h"
#import "FwwContactCell.h"
#import "FwwAddViewController.h"
#import "FwwEditViewController.h"
#define ContactsFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"notes.data"]

@interface FwwContactsViewController ()<UIActionSheetDelegate, FwwAddViewControllerDelegate,FwwEditViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation FwwContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addItem = self.navigationItem.rightBarButtonItem;
    //创建点击模式
    UIBarButtonItem *deleteItem = [ [UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteClick)];
    self.navigationItem.rightBarButtonItems = @[deleteItem, addItem];
    self.navigationItem.leftBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)back {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出账号？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *logoutAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel  handler:nil];
    [alert addAction:logoutAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];

}

- (NSMutableArray *)contacts {
    if (_contacts == nil) {
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:ContactsFilePath];
        if (_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
    }
    return _contacts;
}

- (void)deleteClick
{
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FwwContactCell *cell = [FwwContactCell cellWithTableView:tableView];
    cell.note = self.contacts[indexPath.row];
    return cell;
}

//触发编辑方法；根据editingStyle来判断时那种类型

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsFilePath];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id vc = segue.destinationViewController;
    if ( [vc isKindOfClass:[FwwAddViewController class] ] ) {
        FwwAddViewController *add = segue.destinationViewController;
        add.delegate = self;
    } else  if( [vc isKindOfClass:[FwwEditViewController class] ] ){
        FwwEditViewController *edit = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        edit.note = self.contacts[indexPath.row];
        edit.delegate = self;
    }
}

-(void)addViewController:(FwwAddViewController *)addVc didAddContact:(FwwNote *)contact
{
    //    NSLog(@"%@ - %@", contact.name,contact.phone);
    //添加模型
    [self.contacts addObject:contact];
    //刷新表格
    [self.tableView reloadData];
    //归档
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsFilePath];
}

-(void)editViewController:(FwwEditViewController *)editVc didSavaContact:(FwwNote *)contact
{
    [self.tableView reloadData];
    
    //归档
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsFilePath];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
