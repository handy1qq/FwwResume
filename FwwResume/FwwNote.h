//
//  FwwNote.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/27.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FwwNote : NSObject<NSCoding>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *datetime;

@end
