//
//  ViewController.h
//  x-bionic
//
//  Created by TTC on 12/10/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) iCarousel *carousel;
@property (nonatomic, unsafe_unretained) UILabel *viewpointOffsetLabel;
@property (nonatomic, unsafe_unretained) UILabel *contentOffsetLabel;

- (void)updateViewpointOffset:(UISlider *)slider;
- (void)updateContentOffset:(UISlider *)slider;

@end

