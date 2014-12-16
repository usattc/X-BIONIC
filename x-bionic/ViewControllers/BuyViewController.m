//
//  BuyViewController.m
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "BuyViewController.h"
#import "Defines.h"
#import "BuyTableViewCell.h"

@interface BuyViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    BuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BuyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.buyImageView.image = [UIImage imageNamed:@"buyPic0"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (ScreenHeight - 64) / 2;
}

@end
