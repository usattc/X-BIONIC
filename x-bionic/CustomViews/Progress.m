//
//  Progress.m
//  x-bionic
//
//  Created by TTC on 15/1/7.
//  Copyright (c) 2015年 TTC. All rights reserved.
//

#import "Progress.h"


@implementation Progress

+ (void)showProgressWithBool:(BOOL)isShow {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // 添加等待效果
    if (isShow) {
        [MBProgressHUD showHUDAddedTo:appDelegate.window.rootViewController.view animated:YES];
    }
    // 取消等待效果
    else {
        [MBProgressHUD hideHUDForView:appDelegate.window.rootViewController.view animated:YES];
    }
//    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
//    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:HUD];
//    HUD.mode = MBProgressHUDModeIndeterminate;
//    if (isShow) {
//        [HUD show:YES];
//    }
//    else {
//        [HUD hide:YES];
//    }
}

@end
