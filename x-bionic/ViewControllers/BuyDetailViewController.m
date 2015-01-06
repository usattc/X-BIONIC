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
    NSMutableArray *_productListArr;
}

@end

@implementation BuyDetailViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _productListArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    
//    NSLog(@"%@", tempStr);
    
//    NSString *tempStr = tempArr[@"id"];
//    _productList = 
    ProductCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                                                 forIndexPath:indexPath];
    
    NSString *urlString = [NSString stringWithFormat:@"http://bulo2bulo.com%@_l.jpg", _productListArr[indexPath.row][@"imageUrl"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    cell.nameLable.text = [NSString stringWithFormat:@"%@", _productListArr[indexPath.row][@"name"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", _productListArr[indexPath.row][@"price"]];
    
    
//    NSLog(@"ScreenWidth%g", ScreenWidth);
//    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)getProductList {
//    NSLog(@"%@", _productList);
    NSString *tempStr = [NSString stringWithFormat:@"%@", _productListDic[@"id"]];
    NSString *tempUrlStr = [NSString stringWithFormat:@"http://bulo2bulo.com:8080/mobile/api/category/products.do?navId=10000%ld&subNavId=%@", _cellID, tempStr];
    [[AFHTTPRequestOperationManager manager] GET:tempUrlStr
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _productListArr = responseObject[@"data"];
//        NSLog(@"%@", _productListArr);
        [self initCollectionView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

/**
 *  初始化CollectionView
 */
- (void)initCollectionView {
    UICollectionViewFlowLayout *layout   = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize                      = CGSizeMake(99, 145);
    // 列距
    layout.minimumLineSpacing            = 5;
    layout.sectionInset                  = UIEdgeInsetsMake(5, 5, 5, 5);
    // 行距
    layout.minimumInteritemSpacing       = 5;

    _collectionView                      = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 37, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    _collectionView.dataSource           = self;
    _collectionView.delegate             = self;
    // 垂直方向遇到边框是否反弹
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.autoresizingMask     = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSLog(@"_productList:%@", _productList);
    
    _productListArr = [NSMutableArray array];
    
    //    [self getProductList];
    //    NSLog(@"%ld", _cellID);
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                 target:nil
                                                                                 action:nil];
    UIBarButtonItem *addBuuton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"listButton"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    NSArray *buttonArray = [NSArray arrayWithObjects:searchButton, addBuuton,nil];
    self.navigationItem.rightBarButtonItems = buttonArray;
    
    [self getProductList];
}

@end
