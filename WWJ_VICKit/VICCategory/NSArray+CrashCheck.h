//
//  NSArray+CrashCheck.h
//  My Tool
//
//  Created by 吴伟军 on 2017/3/8.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CrashCheck)

/** 检查是否越界和NSNull如果是返回nil*/
- (id)objectAtindexCheck:(NSUInteger)index;

@end
