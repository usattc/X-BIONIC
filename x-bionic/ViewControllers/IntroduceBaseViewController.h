//
//  IntroduceBaseViewController.h
//  x-bionic
//
//  Created by TTC on 14/12/20.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BaseViewController.h"

@interface IntroduceBaseViewController : BaseViewController

@property (strong, nonatomic) UIScrollView *scrollView;

- (void)initScrollViewSetContentSizeWithWidth:(CGFloat)width andHeight:(CGFloat)height;
- (void)setBackGroundImageWithWidth:(CGFloat)width andHeight:(CGFloat)height andImageName:(NSString *)imageName;

@end
