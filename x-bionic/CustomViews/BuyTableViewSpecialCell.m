//
//  BuyTableViewSpecialCell.m
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyTableViewSpecialCell.h"
#import "BuyCollectionViewCell.h"

@interface BuyTableViewSpecialCell () <UICollectionViewDataSource, UICollectionViewDelegate> {
    UICollectionView *_collectionView;
}

@end

@implementation BuyTableViewSpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(50, 50);
        layout.minimumLineSpacing = 50;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumLineSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        //
        // 把collectionView加到Cell里, 再把Cell加到TableView里
        //
        //
        //
        [self.contentView addSubview:_collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                              forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

@end
