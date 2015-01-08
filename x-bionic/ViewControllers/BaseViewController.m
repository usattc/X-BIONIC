//
//  BaseViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/12.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.edgesForExtendedLayout =UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 让tableView从navigationBar下面开始
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;

    // 把navigationBar的背景色定为灰色
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [backGroundImageView setImage:[UIImage imageNamed:@"backGround"]];
    [self.view addSubview:backGroundImageView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backMainPage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)setTitleString:(NSString *)titleString {
    self.navigationItem.title = titleString;
    // 改title的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor lightGrayColor] forKey:NSForegroundColorAttributeName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backMainPage {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
