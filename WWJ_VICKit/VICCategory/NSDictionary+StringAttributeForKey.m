//
//  NSDictionary+StringAttributeForKey.m
//  My Tool
//
//  Created by 吴伟军 on 16/5/3.
//  Copyright © 2016年 吴伟军. All rights reserved.
//

#import "NSDictionary+StringAttributeForKey.h"

@implementation NSDictionary (StringAttributeForKey)

- (NSString *)stringAttributeForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSObject class]]) {
        
    }else{
        return @"";
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%.2f",[obj floatValue]];
    }
    return @"None";
}

@end
