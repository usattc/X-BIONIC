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
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, 111)];
//        _imageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)nameLable {
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(3, 117, self.contentView.bounds.size.width, 7)];
        _nameLable.textColor = [UIColor whiteColor];
        _nameLable.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_nameLable];
    }
    return _nameLable;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 132, self.contentView.bounds.size.width, 7)];
        _priceLabel.textColor = [UIColor whiteColor];
//        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

@end
