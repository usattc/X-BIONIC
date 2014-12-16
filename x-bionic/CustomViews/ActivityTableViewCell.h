//
//  ActivityTableViewCell.h
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *activityImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UIButton *btn;

@end
