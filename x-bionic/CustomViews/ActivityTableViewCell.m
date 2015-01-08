//
//  ActivityTableViewCell.m
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "Defines.h"

@implementation ActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth / 2, 45)];
        _titleLabel.text = @"厦门马拉松海选";
        _titleLabel.textColor = [UIColor lightGrayColor];
        
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, ScreenWidth - 50, 45)];
        _subTitleLabel.text = @"2014年10月31-2014年1月31日";
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
//        [_subTitleLabel sizeToFit];
//        _subTitleLabel.backgroundColor = [UIColor grayColor];
//        _subTitleLabel.textColor = [UIColor whiteColor];
//        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.baseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, ScreenWidth - 40, ScreenHeight / 3)];
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:self.baseImageView];
        [self.contentView addSubview:_subTitleLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
