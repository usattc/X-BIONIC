//
//  BuyDetailViewController.m
//  x-bionic
//
//  Created by TTC on 14/12/23.
//  Copyright (c) 2014年 TTC. All rights reserved.
//

#import "BuyDetailViewController.h"
#import "ProductCollectionViewCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Defines.h"

@interface BuyDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    NSMutableArray *_productList;
}

@end

@implementation BuyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _productList = [NSMutableArray array];
    
    [self getProductList];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                 target:nil
                                                                                 action:nil];
    UIBarButtonItem *addBuuton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"addButton"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    NSArray *buttonArray = [NSArray arrayWithObjects:searchButton, addBuuton,nil];
    self.navigationItem.rightBarButtonItems = buttonArray;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _productList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    ProductCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                                                 forIndexPath:indexPath];
    NSString *urlString = [NSString stringWithFormat:@"http://bulo2bulo.com%@_l.jpg", _productList[indexPath.row][@"imageUrl"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    cell.nameLable.text = [NSString stringWithFormat:@"%@", _productList[indexPath.row][@"name"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", _productList[indexPath.row][@"price"]];
//    NSLog(@"ScreenWidth%g", ScreenWidth);
//    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)getProductList {
    [[AFHTTPRequestOperationManager manager] GET:@"http://bulo2bulo.com:8080/mobile/api/category/products.do?navId=100001&subNavId=4"
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [_productList addObjectsFromArray:responseObject[@"data"]];
        NSLog(@"_productList:%@", _productList);
        [self initCollectionView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(124, 209);
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumInteritemSpacing = 10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                         collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    // 垂直方向遇到边框是否反弹
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

@end
