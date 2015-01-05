//
//  BuyCollectionViewCell.m
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyCollectionViewCell.h"
#import "Defines.h"

@interface BuyCollectionViewCell () {
    CGFloat _cellWidth;
    CGFloat _cellHeight;
}

@end

@implementation BuyCollectionViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellWidth = 55 * (ScreenWidth / 320);
        _cellHeight = 55 * (ScreenWidth / 320);
    }
    return self;
}

- (UIImageView *)imageView {
    _cellWidth = 55 * (ScreenWidth / 320);
    _cellHeight = 55 * (ScreenWidth / 320);
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.center.x - _cellWidth / 2, self.contentView.center.x - 30, _cellWidth, _cellHeight)];
//        _imageView.backgroundColor = [UIColor redColor];
//        _imageView.center.x = self.contentView.center.x;
//        NSLog(@"x:%g, y:%g", self.contentView.center.x, self.contentView.center.y);
//        self.contentView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.center.x - 20, _cellHeight + 20, self.contentView.bounds.size.width, 10)];
//        NSLog(@"%g, %g", _label.center.x, _label.center.y);
        _label.textColor = [UIColor grayColor];
        // Lable中的字居中
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:11];
        CGFloat temp = self.contentView.center.x;
        _label.center = CGPointMake(temp, _label.center.y);
//        NSLog(@"%g, %g", _label.center.x, _label.center.y);
//        _label.center = self.contentView.center;
        [self.contentView addSubview:_label];
    }
    return _label;
}

@end
