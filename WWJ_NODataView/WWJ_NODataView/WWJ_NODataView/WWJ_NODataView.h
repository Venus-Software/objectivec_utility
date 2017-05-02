//
//  WWJ_NODataView.h
//  My Tool
//
//  Created by 吴伟军 on 2017/5/2.
//  Copyright © 2017年 吴伟军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GestureRecognizer.h"
@interface WWJ_NODataView : UIView

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

+ (WWJ_NODataView*)defaultNoDataView;

@end
