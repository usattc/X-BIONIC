//
//  DesignAndDevelopemtViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "DesignAndDevelopemtViewController.h"
#import "Defines.h"

@interface DesignAndDevelopemtViewController ()

@end

@implementation DesignAndDevelopemtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"设计和研发";
    
    [self initScrollViewSetContentSizeWithWidth:ScreenWidth andHeight:2320];
    
    [self setBackGroundImageWithWidth:ScreenWidth andHeight:2320 andImageName:@"designanddevelopemttext"];
}

@end
