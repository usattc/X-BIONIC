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
#import "Progress.h"
#import "BuyCollectionViewCell.h"

@interface BuyViewController () <UITableViewDataSource, UITableViewDelegate, BuyTableViewSpecialCellDelegate, MBProgressHUDDelegate> {
    UITableView *_tableView;
    NSMutableArray *_cellArr;
    UIButton *_tempBtn;
    NSMutableArray *_productList0;
    NSMutableArray *_productList1;
    // 等待效果
    MBProgressHUD *_HUD;
    // 控制cell能否点击
    BOOL _isUserInteractionEnabled;
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
                                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"%@", error.localizedDescription);
                                             }];
    }
    else if (cellState == 1) {
        [[AFHTTPRequestOperationManager manager] GET:@"http://bulo2bulo.com:8080/mobile/api/category/list.do?navId=100002"
                                          parameters:nil
                                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                 [_productList1 addObjectsFromArray:responseObject[@"data"]];
                                                 // 网络数据获取成功后关闭等待效果, 发送2个请求, 1个判断就够了
                                                 [Progress showProgressWithBool:NO];
                                                 // tableView的cell点击开启
                                                 _isUserInteractionEnabled = YES;
                                                 [_tableView reloadData];
                                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"%@", error.localizedDescription);
                                                 [self alert];
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

#pragma mark - TableViewDelegate

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
        cell.userInteractionEnabled = _isUserInteractionEnabled;
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
        static NSString *identifier = @"Special";
        BuyTableViewSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BuyTableViewSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            // 不能在viewDidLoad中, 因为spcialCell可能还没创建
            cell.delegate = self;
        }
        if (indexPath.row == 1) {
            cell.productListArr = _productList0;
            cell.speciaCellID = 1;
        }
        else {
            cell.productListArr = _productList1;
            cell.speciaCellID = 2;
        }
        [cell.collectionView reloadData];
        return cell;
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

// didSelect自带reloadData
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

#pragma mark - BuyTableViewSpecialCellDelegate

- (void)didClickWithProductListDictionary:(NSDictionary *)productListDictionary {
    BuyDetailViewController *bdvc = [[BuyDetailViewController alloc] init];
    bdvc.productListDic = productListDictionary[@"productList"];
    
    // 把id类型转成NSInteger
    bdvc.cellID = [productListDictionary[@"specialCellID"] integerValue];
    bdvc.productTitleString = productListDictionary[@"productTitle"];
    [self.navigationController pushViewController:bdvc animated:YES];
}

#pragma mark - Error Alert

- (void)alert {
    // 取消等待效果
//    [_HUD hide:YES];
    [Progress showProgressWithBool:NO];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您的网络好像出现了问题"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:actionCancel];
   [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"产品购买";
    
    // tableView的cell点击关闭
    _isUserInteractionEnabled = NO;

    // 打开等待效果
    [Progress showProgressWithBool:YES];
    
    _productList0 = [NSMutableArray array];
    _productList1 = [NSMutableArray array];
    
    // 获取2次网络数据
    [self getDataListWithCellState:0];
    [self getDataListWithCellState:1];
    
    NSArray *arr = @[@"Normal", @"Normal"];
    _cellArr = [NSMutableArray arrayWithArray:arr];
    
    [self createTableView];
}

@end
