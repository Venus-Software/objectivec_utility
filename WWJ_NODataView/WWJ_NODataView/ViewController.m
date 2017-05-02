//
//  ViewController.m
//  WWJ_NODataView
//
//  Created by 吴伟军 on 2017/5/2.
//  Copyright © 2017年 wuwj. All rights reserved.
//

#import "ViewController.h"
#import "WWJ_NODataView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WWJ_NODataView *noDataView = [WWJ_NODataView defaultNoDataView];
    [noDataView setTapActionWithBlock:^{
        NSLog(@"重新加载");
    }];
    [self.view addSubview:noDataView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
