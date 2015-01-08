//
//  BuyTableViewSpecialCell.m
//  x-bionic
//
//  Created by TTC on 14/12/21.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyTableViewSpecialCell.h"
#import "BuyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "Defines.h"
#import "BuyDetailViewController.h"

@interface BuyTableViewSpecialCell () <UICollectionViewDataSource, UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    NSString *_urlString;
}

@end

@implementation BuyTableViewSpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout     = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize                        = CGSizeMake(ScreenWidth / 4, 80);
        layout.minimumLineSpacing              = 10;
        layout.minimumInteritemSpacing         = 0;
        layout.sectionInset                    = UIEdgeInsetsMake(0, 0, 0, 0);

        _collectionView                        = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
        _collectionView.dataSource             = self;
        _collectionView.delegate               = self;
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.autoresizingMask       = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_collectionView registerClass:[BuyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        // 把collectionView加到Cell里, 再把Cell加到TableView里
        self.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_collectionView];
        }
    return self;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _productListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    BuyCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                              forIndexPath:indexPath];
    NSString *urlString = [NSString stringWithFormat:@"http://www.bulo2bulo.com:8080/%@_L.png", _productListArr[indexPath.row][@"imageUrl"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
     cell.label.text = _productListArr[indexPath.row][@"name"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(didClickWithProductListDictionary:)]) {
        // 把_productList里的产品数据传过去, NSInteger不是对象, 要转一下
        [_delegate didClickWithProductListDictionary:@{@"specialCellID":[NSNumber numberWithInteger:_speciaCellID], @"productList":_productListArr[indexPath.row], @"productTitle":_productListArr[indexPath.row][@"name"]}];
    }
}

@end
