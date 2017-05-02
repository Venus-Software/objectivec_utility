//
//  UIView+GestureRecognizer.m
//  My Tool
//
//  Created by 吴伟军 on 2017/2/17.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import "UIView+GestureRecognizer.h"

@implementation UIView (GestureRecognizer)

const NSString *kDTActionHandlerTapGestureKey = @"Tap";
const NSString *kDTActionHandlerButtonKey = @"Button";
- (void)setTapActionWithBlock:(void (^)(void))block{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, block, OBJC_ASSOCIATION_COPY);
}

//检测view的tap方法是否有对应的触发方法，没有，则进行自动创建，并将方法传递，防止因为没有方法而闪退

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateRecognized) {//如果相应
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
        if (action) {
            action();
        }
    }
}

- (void)setButtonActionWithButton:(UIButton *)button Block:(void (^)(void))block{
    button = objc_getAssociatedObject(self, &kDTActionHandlerButtonKey);
    if (!button) {
        [button addTarget:self action:@selector(__handleActionForButton:) forControlEvents:(UIControlEventTouchUpInside)];
        objc_setAssociatedObject(self, &kDTActionHandlerButtonKey, button, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kDTActionHandlerButtonKey, block, OBJC_ASSOCIATION_COPY);
    
}

@end
