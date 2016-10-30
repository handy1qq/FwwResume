//
//  FwwProject.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwProject.h"

@implementation FwwProject
- (instancetype)initWithDict:(NSDictionary *)dict {
    if ( self = [super init] ) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.SBName = dict[@"SBName"];
    }
    return self;
}

+ (instancetype)projectWithDict:(NSDictionary *)dict {
    return [ [self alloc] initWithDict:dict];

}

@end
