//
//  ProductCollectionViewCell.m
//  x-bionic
//
//  Created by TTC on 14/12/23.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, 50)];
        _imageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)nameLable {
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.contentView.bounds.size.width, 5)];
        _nameLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_nameLable];
    }
    return _nameLable;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.contentView.bounds.size.width, 5)];
        _priceLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

@end
