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
//    NSMutableArray *_productList;
    NSString *_urlString;
    NSInteger _speciaCellID;
}

@end

@implementation BuyTableViewSpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    _productList = [NSMutableArray array];
    if (self) {
//        if ([reuseIdentifier isEqualToString:@"Special1"]) {
//            _urlString = [self urlStingwithCellID:1];
////            _cellID = 1;
//        }
//        else {
//            _urlString = [self urlStingwithCellID:2];
////            _cellID = 2;
//        }
//        [_productList addObjectsFromArray:self.productList];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(ScreenWidth / 4, 100);
        //            NSLog(@"heigh:%g", self.contentView.bounds.size.height / 2);
        //            NSLog(@"ScreenHeight:%g", ScreenHeight);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_collectionView registerClass:[BuyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        //
        // 把collectionView加到Cell里, 再把Cell加到TableView里
        //
        
        self.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundColor = [UIColor clearColor];
//        self.contentView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_collectionView];
//        [[AFHTTPRequestOperationManager manager] GET:_urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            [_productList addObjectsFromArray:productList];
        
//            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//            layout.itemSize = CGSizeMake(ScreenWidth / 4, self.contentView.bounds.size.height / 2.3);
////            NSLog(@"heigh:%g", self.contentView.bounds.size.height / 2);
////            NSLog(@"ScreenHeight:%g", ScreenHeight);
//            layout.minimumLineSpacing = 0;
//            layout.minimumInteritemSpacing = 0;
//            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//            
//            _collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
//            _collectionView.dataSource = self;
//            _collectionView.delegate = self;
//            _collectionView.alwaysBounceHorizontal = YES;
//            _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//            [_collectionView registerClass:[BuyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//            
//            //
//            // 把collectionView加到Cell里, 再把Cell加到TableView里
//            //
//            
//            self.backgroundColor = [UIColor clearColor];
//            _collectionView.backgroundColor = [UIColor clearColor];
//            [self.contentView addSubview:_collectionView];
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"%@", error.localizedDescription);
//        }];
        }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _productList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    BuyCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                              forIndexPath:indexPath];
    NSString *urlString = [NSString stringWithFormat:@"http://www.bulo2bulo.com:8080/%@_L.png", _productList[indexPath.row][@"imageUrl"]];
//    NSLog(@"urlString:%@", urlString);
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
     cell.label.text = _productList[indexPath.row][@"name"];
//    NSLog(@"%@", _productList);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ID:%@", _productList[indexPath.row][@"id"]);
//    if (_cellID == 1) {
////        if (_delegate && [_delegate respondsToSelector:@selector(passID:)]) {
////            [_delegate passID:_productList[indexPath.row][@"id"]];
////        }
////        [self ]
//    }
//    else {
//         NSLog(@"click:%ld", indexPath.row + 10);
//    }
    
    
}

//- (NSString *)urlStingwithCellID:(NSInteger)cellID {
//    if (cellID == 1) {
//        return @"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100001";
//    }
//    else {
//        return @"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100002";
//    }
//}

@end
