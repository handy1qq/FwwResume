//
//  FwwMusic.h
//  FwwResume
//
//  Created by fengwenwei on 16/10/26.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FwwMusic : NSObject<NSCoding>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *audio;
@property (nonatomic, copy) NSString *volume;

@end
