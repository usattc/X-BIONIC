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

@interface BuyViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_arr;
}

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"0", @"1"];
    _arr = [NSMutableArray arrayWithArray:arr];
    
    [self createTableView];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    // 让_tableView的分割线右边收20
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    BuyTableViewNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BuyTableViewNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    cell.buyImageView.image = [UIImage imageNamed:@"buyPic0"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (ScreenHeight - 64) / 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_arr addObject:@"2"];
    NSMutableArray *indexPathsArr = [[NSMutableArray alloc] init];
    NSIndexPath *indexPathNum = [NSIndexPath indexPathForRow:0 inSection:0];
    [indexPathsArr addObject:indexPathNum];
    [tableView insertRowsAtIndexPaths:indexPathsArr withRowAnimation:UITableViewRowAnimationTop];
}

@end
