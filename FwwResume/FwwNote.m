//
//  FwwNote.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/27.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwNote.h"

@implementation FwwNote

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.datetime forKey:@"datetime"];

}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.datetime = [aDecoder decodeObjectForKey:@"datetime"];
    }
    return self;

}
@end
