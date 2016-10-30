//
//  FwwEditViewController.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/28.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FwwNote, FwwEditViewController;
@protocol  FwwEditViewControllerDelegate<NSObject>

- (void)editViewController:(FwwEditViewController *)editVc didSavaContact:(FwwNote *)contact;

@end

@interface FwwEditViewController : UIViewController

/**Fwwnote */
@property (strong, nonatomic) FwwNote *note;
/**  delegate */
@property (nonatomic, weak) id<FwwEditViewControllerDelegate> delegate;



@end
