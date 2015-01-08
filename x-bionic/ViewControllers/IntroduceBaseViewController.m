//
//  IntroduceBaseViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "IntroduceBaseViewController.h"
#import "Defines.h"

@interface IntroduceBaseViewController ()

@end

@implementation IntroduceBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.showsVerticalScrollIndicator = NO;
}

// 放入原图的原始尺寸即可
- (void)initScrollViewSetContentSizeWithWidth:(CGFloat)width andHeight:(CGFloat)height {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    CGFloat heightTemp = (height / 2 + 64);
    height = heightTemp;
//    NSLog(@"ScreenWidth:%g", ScreenWidth);
//    NSLog(@"height:%g", height);
    _scrollView.contentSize = CGSizeMake(width, height);
//    NSLog(@"ScreenWidth:%g", ScreenWidth);
//    NSLog(@"ScreenHeight:%g", ScreenHeight);
    [self.view addSubview:_scrollView];
}

- (void)setBackGroundImageWithWidth:(CGFloat)width andHeight:(CGFloat)height andImageName:(NSString *)imageName {
    CGFloat heightTemp = (height / 2);
    height = heightTemp;
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    NSLog(@"width:%g", width);
//    NSLog(@"height:%g", height);
    [backGroundImageView setImage:[UIImage imageNamed:imageName]];
    [_scrollView addSubview:backGroundImageView];
}

@end
