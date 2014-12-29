//
//  BuyViewController.m
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "BuyViewController.h"
#import "Defines.h"
#import "BuyTableViewNormalCell.h"
#import "BuyTableViewSpecialCell.h"
#import "BuyDetailViewController.h"
#import "AFNetworking.h"

@interface BuyViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_cellArr;
    UIButton *_tempBtn;
//    NSInteger _specialCellID;
//    NSMutableArray *_specialCellProductList1;
//    NSMutableArray *_specialCellProductList2;
//    NSInteger _specialCellState; // 记录当前出来的是哪个SpecailCell
    NSMutableArray *_productList0;
    NSMutableArray *_productList1;
}

@end

@implementation BuyViewController

// 在这个页面启动时先获取2个SpecialCell的数据
- (void)getDataListWithCellState:(NSInteger)cellState {
    if (cellState == 0) {
        [[AFHTTPRequestOperationManager manager] GET:@"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100001"
                                          parameters:nil
                                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                 [_productList0 addObjectsFromArray:responseObject[@"data"]];
//                                                 NSLog(@"_productList0:%@", _productList0[0]);
                                                 //                                                 [self createTableView];
                                                 //                                                 [_tableView reloadData];
                                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"%@", error.localizedDescription);
                                             }];
    }
    else if (cellState == 1) {
        [[AFHTTPRequestOperationManager manager] GET:@"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100002"
                                          parameters:nil
                                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                 [_productList1 addObjectsFromArray:responseObject[@"data"]];
//                                                 NSLog(@"_productList1:%@", _productList1[0]);
                                                 //                                                 [self createTableView];
                                                 //                                                 [_tableView reloadData];
                                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"%@", error.localizedDescription);
                                             }];
    }
    
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    // 让_tableView的分割线右边收20
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建Normal的cell
    if ([_cellArr[indexPath.row] isEqualToString:@"Normal"]) {
        static NSString *identifier = @"Normal";
        BuyTableViewNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BuyTableViewNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        // 第一个NormalCell
        if (indexPath.row == 0) {
            cell.buyImageView.image = [UIImage imageNamed:@"buyPic0"];
        }
        // 第二个NormalCell
        else {
            cell.buyImageView.image = [UIImage imageNamed:@"buyPic1"];
        }
        
        return cell;
    }
    // 创建SpecialCell, 并把网络数据传进去
    else {
//        NSArray *productListArr = [[NSArray alloc] init];
        static NSString *identifier = @"Special";
        BuyTableViewSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BuyTableViewSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        if (indexPath.row == 1) {
            cell.productList = _productList0;
        }
        else {
            cell.productList = _productList1;
        }
        [cell.collectionView reloadData];
        return cell;
        
        // 第一个SpecialCell, 用它们的identifier来区别2个SpecialCell
//        if (indexPath.row == 1) {
//            static NSString *identifier = @"Special";
//            BuyTableViewSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//            if (cell == nil) {
//                cell = [[BuyTableViewSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//            }
//            return cell;
//        }
//        // 第二个SpecialCell
//        else {
//            static NSString *identifier = @"Special2";
//            BuyTableViewSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//            if (cell == nil) {
//                cell = [[BuyTableViewSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//            }
//            return cell;
//        }
//    }
//    else {
//        NSLog(@"错误的Cell");
//    }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Special的cell高度低点
    if ([_cellArr[indexPath.row] isEqualToString:@"Special"]) {
        return (ScreenHeight - 64) / 2.7;
    }
    else {
        return (ScreenHeight - 64) / 2;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 当cell已经有3个的时候, 再次点击就删除
    if (_cellArr.count == 3) {
        NSMutableArray *indexPathsArr = [[NSMutableArray alloc] init];
        NSIndexPath *indexPathNum = [NSIndexPath indexPathForRow:[_cellArr indexOfObject:@"Special"] inSection:0];
        [indexPathsArr addObject:indexPathNum];
        // 这句不能写在最后面, 要先删除数据源再删除cell
        [_cellArr removeObject:@"Special"];
        [tableView deleteRowsAtIndexPaths:indexPathsArr withRowAnimation:UITableViewRowAnimationTop];
        tableView.scrollEnabled = YES;
        return;
    }
    // cell小于3的时候, 点击就会加一个cell
    else {
        // 这句要写在最前面, 否则新创建一个cell但数据源是空的
        [_cellArr insertObject:@"Special" atIndex:indexPath.row + 1];
        NSMutableArray *indexPathsArr = [[NSMutableArray alloc] init];
        NSIndexPath *indexPathNum = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [indexPathsArr addObject:indexPathNum];
        [tableView insertRowsAtIndexPaths:indexPathsArr withRowAnimation:UITableViewRowAnimationTop];
        
        // 如果点的不是第1个cell, tableViewCell跳到新创建的那一行
        if (indexPath.row != 0)  {
            [tableView scrollToRowAtIndexPath:indexPathNum atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//            [tableView setContentOffset:CGPointMake(0, ScreenHeight / 2) animated:YES];
        }
        
        tableView.scrollEnabled = NO;
    }
}

- (void)push {
    BuyDetailViewController *bvc = [[BuyDetailViewController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _productList0 = [NSMutableArray array];
    _productList1 = [NSMutableArray array];
    
    [self getDataListWithCellState:0];
    [self getDataListWithCellState:1];
    
    //    NSString *(^getUrlString)(NSInteger) = ^(NSInteger cellID){
    //        if (cellID == 1) {
    //            return @"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100001";
    //        }
    //        else {
    //            return @"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100002";
    //        }
    //    };
    
    NSArray *arr = @[@"Normal", @"Normal"];
    _cellArr = [NSMutableArray arrayWithArray:arr];
    
    _tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _tempBtn.frame = CGRectMake(100, 100, 50, 40);
    [_tempBtn setTitle:@"产品" forState:UIControlStateNormal];
    [_tempBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:_tempBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    [self createTableView];
}

@end
