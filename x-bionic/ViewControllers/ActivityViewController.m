//
//  ActivityViewController.m
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "Defines.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface ActivityViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_dataList;
    NSDateFormatter *_originalDateFormater;
    NSDateFormatter *_convertDateFormater;
}

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"X的活动";

    _dataList = [NSMutableArray array];
    
    _originalDateFormater = [[NSDateFormatter alloc] init];
    [_originalDateFormater setDateFormat:@"MM/dd/yyyy"];
    
    _convertDateFormater = [[NSDateFormatter alloc] init];
    [_convertDateFormater setDateFormat:@"yyyy年MM月dd日"];
    
    [self getDataList];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    // 让_tableView的分割线右边收20
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    NSString *urlString = [NSString stringWithFormat:@"http://bulo2bulo.com%@.jpg", _dataList[indexPath.row][@"titleImageUrl"]];
//    NSURL *url = [NSURL URLWithString:urlString];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", _dataList[indexPath.row][@"title"]];
    NSDate *createDate = [_originalDateFormater dateFromString:[_dataList[indexPath.row][@"createDate"] substringToIndex:10]];
    NSString *createDateStr = [_convertDateFormater stringFromDate:createDate];
    NSDate *endTime = [_originalDateFormater dateFromString:[_dataList[indexPath.row][@"endTime"] substringToIndex:10]];
    NSString *endTimeStr = [_convertDateFormater stringFromDate:endTime];
    cell.subTitleLabel.text = [NSString stringWithFormat:@"%@ - %@", createDateStr, endTimeStr];
    [cell setImageWithURL:[NSString stringWithFormat:@"http://bulo2bulo.com%@.jpg", _dataList[indexPath.row][@"titleImageUrl"]]];
//    [cell.baseImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bulo2bulo.com%@.jpg", _dataList[indexPath.row][@"titleImageUrl"]]]];
//    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ScreenHeight / 2;
}

- (void)getDataList {
    [[AFHTTPRequestOperationManager manager] GET:@"http://bulo2bulo.com:8080/mobile/api/search/keyword.do?type=2"
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [_dataList addObjectsFromArray:responseObject[@"data"]];
        [self createTableView];
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

@end
