//
//  UIView+GestureRecognizer.h
//  My Tool
//
//  Created by 吴伟军 on 2017/2/17.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIView (GestureRecognizer)
//UIView添加手势事件
/*
 *Tap
 */
- (void)setTapActionWithBlock:(void(^)(void))block;
/*
 *ButtonAction
 */

- (void)setButtonActionWithButton:(UIButton *)button Block:(void(^)(void))block;
@end
