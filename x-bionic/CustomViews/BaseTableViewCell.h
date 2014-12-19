//
//  BaseTableViewCell.h
//  x-bionic
//
//  Created by TTC on 14/12/19.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *baseImageView; // 只申明不初始化, 初始化给它的子类去做

- (void)setImageWithURL:(NSString *)uslString;

@end