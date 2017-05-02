//
//  UIViewController+NavBarHidden.m
//  My Tool
//
//  Created by 吴伟军 on 2017/2/28.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import "UIViewController+NavBarHidden.h"
#import <objc/runtime.h>

@interface UIViewController ()
@property (strong, nonatomic) UIImage * navBarBackgroundImage;

@end

@implementation UIViewController (NavBarHidden)

#pragma mark - 通过运行时动态添加存储属性
//定义关联的Key
static const char * key = "keyScrollView";
- (UIScrollView *)keyScrollView{
    
    return objc_getAssociatedObject(self, key);
}

- (void)setKeyScrollView:(UIScrollView *)keyScrollView{
    objc_setAssociatedObject(self, key, keyScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//定义关联的Key
static const char *navBarBackgroundImageKey = "navBarBackgroundImage";
- (UIImage *)navBarBackgroundImage{
    return objc_getAssociatedObject(self, navBarBackgroundImageKey);
}

- (void)setNavBarBackgroundImage:(UIImage *)navBarBackgroundImage{
    objc_setAssociatedObject(self, navBarBackgroundImageKey, navBarBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//定义关联的Key
static const char *isLeftAlphaKey = "isLeftAlpha";
- (BOOL)isLeftAlpha{
    return [objc_getAssociatedObject(self, isLeftAlphaKey) boolValue];
}
- (void)setIsLeftAlpha:(BOOL)isLeftAlpha{
    objc_setAssociatedObject(self, isLeftAlphaKey, @(isLeftAlpha), OBJC_ASSOCIATION_ASSIGN);
}

//定义关联的Key
static const char *isTitleAlphaKey = "isTitleAlpha";
- (BOOL)isIsTitleAlpha{
    return [objc_getAssociatedObject(self, isTitleAlphaKey) boolValue];
}
- (void)setIsTitleAlpha:(BOOL)isTitleAlpha{
    objc_setAssociatedObject(self, isTitleAlphaKey, @(isTitleAlpha), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - 核心代码-即对外接口功能实现代码
static CGFloat alpha = 0;
//透明度
- (void)scrollControlByOffsetY:(CGFloat)offsetY{
    if ([self getScrollView]) {
        UIScrollView *scrollerView = [self getScrollView];
        alpha = scrollerView.contentOffset.y/offsetY;
    }else{
        return;
    }
    //设置导航条上的标签是否跟着透明
    self.navigationItem.leftBarButtonItem.customView.alpha = self.isLeftAlpha?alpha:1;
    self.navigationItem.titleView.alpha = self.isTitleAlpha?alpha:1;
    self.navigationItem.rightBarButtonItem.customView.alpha = self.isRightAlpha?alpha:1;
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:alpha];
}

- (void)setInViewWillAppear{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.navBarBackgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    });
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:self.navBarBackgroundImage forBarMetrics:(UIBarMetricsDefault)];
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [self getScrollView].contentOffset = CGPointMake(0, self.keyScrollView.contentOffset.y - 1);
    [self getScrollView].contentOffset = CGPointMake(0, self.keyScrollView.contentOffset.y + 1);
}

- (void)setInViewWillDisappear{
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0]setAlpha:1];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setShadowImage:nil];
}

#pragma mark - 内部方法
// 获取tableView 或者 collectionView
- (UIScrollView *)getScrollView{
    if ([self isKindOfClass:[UITableViewController class]]) {
        return (UIScrollView *)self.view;
    }else if ([self isKindOfClass:[UICollectionViewController class]]){
        return (UIScrollView *)self.view;
    }else{
        for (UIView *view in self.view.subviews) {
            if([view isEqual:self.keyScrollView] & [view isKindOfClass:[UIScrollView class]]){
                return (UIScrollView *)view;
            }
        }
    }
    return nil;
}

@end
