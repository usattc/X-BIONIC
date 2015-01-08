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
#import "Progress.h"

@interface BuyDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    NSMutableArray *_productListArr;
    NSMutableArray *_originProductListArr;
}

@end

@implementation BuyDetailViewController

#pragma mark - UICollectionViewDelegate

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
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@.00", _productListArr[indexPath.row][@"price"]];
//    NSLog(@"%@", [_productListArr[indexPath.row][@"price"] class]);
    
    
//    NSLog(@"ScreenWidth%g", ScreenWidth);
//    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

/**
 *  获取产品数据, 取responseObject[@"data"]里的数组
 */
- (void)getProductList {
//    NSLog(@"%@", _productList);
    NSString *tempStr = [NSString stringWithFormat:@"%@", _productListDic[@"id"]];
    NSString *tempUrlStr = [NSString stringWithFormat:@"http://bulo2bulo.com:8080/mobile/api/category/products.do?navId=10000%ld&subNavId=%@", _cellID, tempStr];
    [[AFHTTPRequestOperationManager manager] GET:tempUrlStr
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                                             NSLog(@"responseObject:%@", [responseObject[@"data"] class]);
        // responseObject[@"data"]里的数组是不可变的, 要转可变
        _productListArr = [responseObject[@"data"] mutableCopy];
        _originProductListArr = _productListArr;
        // 获取到数组后开始初始化CollectionView
        [self initCollectionView];
        [Progress showProgressWithBool:NO];
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
    // 行距
    layout.minimumLineSpacing            = 10;
    layout.sectionInset                  = UIEdgeInsetsMake(5, 5, 5, 5);
    // 列距
    layout.minimumInteritemSpacing       = 5;

    _collectionView                      = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 39, self.view.bounds.size.width, self.view.bounds.size.height - 39) collectionViewLayout:layout];
    _collectionView.dataSource           = self;
    _collectionView.delegate             = self;
    // 垂直方向遇到边框是否反弹
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.autoresizingMask     = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

// 产品的标题, 重写ProductTitleString
- (void)setProductTitleString:(NSString *)productTitleString {
    self.titleString = productTitleString;
}

#pragma mark - Sort Method

// 升序方法
- (void)ascend {
    NSArray *ascendArr = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES]];
    [_productListArr sortUsingDescriptors:ascendArr];
    [_collectionView reloadData];
}

// 降序方法
- (void)descend {
    NSArray *ascendArr = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"price" ascending:NO]];
    [_productListArr sortUsingDescriptors:ascendArr];
    [_collectionView reloadData];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Progress showProgressWithBool:YES];
    
    // 升序按钮
    UIButton *ascendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ascendBtn.frame     = CGRectMake(0, self.view.bounds.origin.x, self.view.bounds.size.width / 2, 37);
    [ascendBtn setTitle:@"￥ 价格 ↑" forState:UIControlStateNormal];
    [ascendBtn setBackgroundImage:[UIImage imageNamed:@"buttonbackgroundActive"] forState:UIControlStateNormal];
    [ascendBtn addTarget:self action:@selector(ascend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ascendBtn];
    
    // 降序按钮
    UIButton *descendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    descendBtn.frame     = CGRectMake(self.view.bounds.size.width / 2, self.view.bounds.origin.x, self.view.bounds.size.width / 2, 37);
    [descendBtn setTitle:@"￥ 价格 ↓" forState:UIControlStateNormal];
    [descendBtn setBackgroundImage:[UIImage imageNamed:@"buttonbackgroundActive"] forState:UIControlStateNormal];
    [descendBtn addTarget:self action:@selector(descend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:descendBtn];
    
    _productListArr = [NSMutableArray array];
    _originProductListArr = [NSMutableArray array];
    
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
