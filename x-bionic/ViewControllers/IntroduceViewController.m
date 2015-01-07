//
//  IntroduceViewController.m
//  x-bionic
//
//  Created by TTC on 12/11/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "IntroduceViewController.h"
#import "Defines.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "IntroduceTableViewCell.h"
#import "HistroyViewController.h"
#import "AwareViewController.h"
#import "BionicProtoViewController.h"
#import "ProductionBaseViewController.h"
#import "DesignAndDevelopemtViewController.h"

@interface IntroduceViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSArray *_picsName;
}

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    _picsName = @[@"histroy-ip5", @"awareimg-ip5", @"bionicprototype-ip5", @"productionbase-ip5", @"designanddevelopemt-ip5"];
    [self createTableView];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _picsName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    IntroduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[IntroduceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.baseImageView.image = [UIImage imageNamed:_picsName[indexPath.row]];
    // 填充效果
    cell.baseImageView.contentMode = UIViewContentModeScaleToFill;
    cell.baseImageView.clipsToBounds = YES;
//    cell.baseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_picsName[indexPath.row]]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (ScreenHeight - 64) / 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [_picsName indexOfObject:@"histroy-ip5"]) {
        HistroyViewController *hvc = [[HistroyViewController alloc] init];
        [self.navigationController pushViewController:hvc animated:YES];
    }
    else if (indexPath.row == [_picsName indexOfObject:@"awareimg-ip5"]) {
        AwareViewController *avc = [[AwareViewController alloc] init];
        [self.navigationController pushViewController:avc animated:YES];
    }
    else if (indexPath.row == [_picsName indexOfObject:@"bionicprototype-ip5"]) {
        BionicProtoViewController *bvc = [[BionicProtoViewController alloc] init];
        [self.navigationController pushViewController:bvc animated:YES];
    }
    else if (indexPath.row == [_picsName indexOfObject:@"productionbase-ip5"]) {
        ProductionBaseViewController *pvc = [[ProductionBaseViewController alloc] init];
        [self.navigationController pushViewController:pvc animated:YES];
    }
    else if (indexPath.row == [_picsName indexOfObject:@"designanddevelopemt-ip5"]) {
        DesignAndDevelopemtViewController *dvc = [[DesignAndDevelopemtViewController alloc] init];
        [self.navigationController pushViewController:dvc animated:YES];
    }
}

@end
