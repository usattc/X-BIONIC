//
//  HistroyViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "HistroyViewController.h"
#import "Defines.h"

@interface HistroyViewController ()

@end

@implementation HistroyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"品牌历史";
    
    [self initScrollViewSetContentSizeWithWidth:ScreenWidth andHeight: 2152];
    NSLog(@"ScreenWidth:%g", ScreenWidth);

    [self setBackGroundImageWithWidth:ScreenWidth andHeight:2152 andImageName:@"histroytext"];
}

@end
