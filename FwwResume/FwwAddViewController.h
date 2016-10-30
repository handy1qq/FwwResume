//
//  FwwAddViewController.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/28.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FwwNote,FwwAddViewController;

@protocol FwwAddViewControllerDelegate <NSObject>

- (void)addViewController:(FwwAddViewController *)addVc didAddContact: (FwwNote *)note;

@end

@interface FwwAddViewController : UIViewController

/**  addView */
@property (nonatomic, weak) id<FwwAddViewControllerDelegate> delegate;

@end
