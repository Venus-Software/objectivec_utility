//
//  WWJ_NODataView.m
//  My Tool
//
//  Created by 吴伟军 on 2017/5/2.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import "WWJ_NODataView.h"

static WWJ_NODataView *noDataView = nil;

@implementation WWJ_NODataView



+ (WWJ_NODataView *)defaultNoDataView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noDataView = [[[UINib nibWithNibName:@"WWJ_NODataView" bundle:nil] instantiateWithOwner:self options:nil]firstObject];
        noDataView.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
    });
    return noDataView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
