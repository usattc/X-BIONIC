//
//  BuyCollectionViewCell.h
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol BuyCollectionViewCellDelegate <NSObject>
//
//- (void)isBuyCollectionViewCellInitSuccess:(BOOL)isSuccess;
//
//@end

@interface BuyCollectionViewCell : UICollectionViewCell

//@property (nonatomic) id<BuyCollectionViewCellDelegate> delegate;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;

@end
