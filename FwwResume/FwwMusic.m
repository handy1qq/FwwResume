//
//  FwwMusic.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/26.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwMusic.h"

@implementation FwwMusic
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.icon forKey:@"icon"];
    [encoder encodeObject:self.audio forKey:@"audio"];
    [encoder encodeObject:self.volume forKey:@"volume"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.icon = [decoder decodeObjectForKey:@"icon"];
        self.audio = [decoder decodeObjectForKey:@"audio"];
        self.volume = [decoder decodeObjectForKey:@"volume"];
    }
    return self;
}
@end
