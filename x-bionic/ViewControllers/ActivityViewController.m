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

@interface ActivityViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
}

@end

@implementation ActivityViewController

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
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.activityImageView.image = [UIImage imageNamed:@"ActivityPic"];
//    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ScreenHeight / 2;
}

@end
