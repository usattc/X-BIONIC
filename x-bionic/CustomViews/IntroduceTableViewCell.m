//
//  IntroduceTableViewCell.m
//  x-bionic
//
//  Created by TTC on 14/12/19.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "IntroduceTableViewCell.h"
#import "Defines.h"

@implementation IntroduceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.baseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight - 64) / 5)];
        [self.contentView addSubview:self.baseImageView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
