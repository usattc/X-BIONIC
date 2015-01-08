//
//  AwareViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "AwareViewController.h"
#import "Defines.h"

@interface AwareViewController ()

@end

@implementation AwareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"所获奖项";
    
    [self initScrollViewSetContentSizeWithWidth:ScreenWidth andHeight:1440];
    
    [self setBackGroundImageWithWidth:ScreenWidth andHeight:1440 andImageName:@"awareingtext"];
}

@end
