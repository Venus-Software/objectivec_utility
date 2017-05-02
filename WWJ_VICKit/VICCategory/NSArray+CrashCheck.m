//
//  NSArray+CrashCheck.m
//  My Tool
//
//  Created by 吴伟军 on 2017/3/8.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import "NSArray+CrashCheck.h"

@implementation NSArray (CrashCheck)
- (id)objectAtindexCheck:(NSUInteger)index{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end
