//
//  BuyTableViewNormalCell.m
//  x-bionic
//
//  Created by TTC on 14/12/15.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyTableViewNormalCell.h"
#import "Defines.h"

@implementation BuyTableViewNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _buyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight - 64) / 2)];
//        _buyImageView.image = [UIImage imageNamed:@"buyPic0"];
        [self.contentView addSubview:_buyImageView];
        
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
