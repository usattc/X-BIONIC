//
//  BuyTableViewSpecialCell.h
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyTableViewSpecialCellDelegate <NSObject>

- (void)didClickWithProductListDictionary:(NSDictionary *)productListDictionary;

@end

@interface BuyTableViewSpecialCell : UITableViewCell

@property (nonatomic) id<BuyTableViewSpecialCellDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *productListArr;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSInteger speciaCellID;

@end
