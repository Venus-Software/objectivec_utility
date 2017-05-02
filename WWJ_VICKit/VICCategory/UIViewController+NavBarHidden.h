//
//  UIViewController+NavBarHidden.h
//  My Tool
//
//  Created by 吴伟军 on 2017/2/28.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavBarHidden)

/** 需要监听的view*/
@property (strong, nonatomic) UIScrollView *keyScrollView;

/** 设置导航条上的标签是否需要跟随滚动变化透明度，默认不会跟随滚动变化透明度 */
@property (assign, nonatomic) BOOL isLeftAlpha;
@property (assign, nonatomic) BOOL isTitleAlpha;
@property (assign, nonatomic) BOOL isRightAlpha;

/** 清除默认导航条的背景设置 */
- (void)setInViewWillAppear;
- (void)setInViewWillDisappear;

/** 偏移offsetY的距离后，导航条的alpha为1*/
/** 实际使用，你可以在任何位置写这段代码，让其显现，十分自由*/
- (void)scrollControlByOffsetY:(CGFloat)offsetY;

@end
