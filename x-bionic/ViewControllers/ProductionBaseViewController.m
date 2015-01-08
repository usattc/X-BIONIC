//
//  ProductionBaseViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "ProductionBaseViewController.h"
#import "Defines.h"

@interface ProductionBaseViewController ()

@end

@implementation ProductionBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"生产基地";
    
    [self initScrollViewSetContentSizeWithWidth:ScreenWidth andHeight:960];
    
    [self setBackGroundImageWithWidth:ScreenWidth andHeight:960 andImageName:@"productbasetext"];
}

@end
