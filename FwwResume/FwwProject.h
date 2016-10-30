//
//  FwwProject.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FwwProject : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *SBName;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)projectWithDict:(NSDictionary *)dict;

@end
