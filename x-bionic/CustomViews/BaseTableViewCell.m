//
//  BaseTableViewCell.m
//  x-bionic
//
//  Created by TTC on 14/12/19.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation BaseTableViewCell

- (void)setImageWithURL:(NSString *)uslString {
    NSURL *url = [[NSURL alloc] initWithString:uslString];
    [_baseImageView sd_setImageWithURL:url];
}

@end
