//
//  BionicProtoViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BionicProtoViewController.h"
#import "Defines.h"

@interface BionicProtoViewController ()

@end

@implementation BionicProtoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initScrollViewSetContentSizeWithWidth:ScreenWidth andHeight:1040];
    [self setBackGroundImageWithWidth:ScreenWidth andHeight:1040 andImageName:@"bionicprototypetext"];
}

@end
