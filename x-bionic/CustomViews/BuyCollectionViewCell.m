//
//  BuyCollectionViewCell.m
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyCollectionViewCell.h"

@implementation BuyCollectionViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 111, 140)];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end
