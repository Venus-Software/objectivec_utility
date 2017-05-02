//
//  NSDictionary+StringAttributeForKey.h
//  My Tool
//
//  Created by 吴伟军 on 16/5/3.
//  Copyright © 2016年 吴伟军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (StringAttributeForKey)

/**
 *  将字典中所有的数据类型转化为 NSString
 *
 *  @param key 键值
 *
 *  @return 返回字符串
 */
- (NSString *)stringAttributeForKey:(NSString *)key;


@end
