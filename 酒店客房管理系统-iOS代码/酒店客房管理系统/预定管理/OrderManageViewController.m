//
//  OrderManageViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "OrderManageViewController.h"
#import "OrderManagerCell.h"
#import "Header.h"

@interface OrderManageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation OrderManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBGColor];
    [self.navigationItem setTitle:@"预定管理"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"nav_back"]forState:UIControlStateNormal];
    backButton.frame=CGRectMake(0,0,28,28);
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
}

- (void)createBGColor {
    self.view.backgroundColor = RGB(241, 245, 249);
    UIView *colorBackgroundView = [[UIView alloc]init];
    colorBackgroundView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:colorBackgroundView];
    
    //背景颜色渐变
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef color1 = CGColorCreate(colorSpaceRef, (CGFloat[]){90/255.0,134/255.0,218/255.0,1.0});
    CGColorRef color2 = CGColorCreate(colorSpaceRef, (CGFloat[]){80/255.0,176/255.0,210/255.0,1.0});
    CGColorRef color3 = CGColorCreate(colorSpaceRef, (CGFloat[]){122/255.0,216/255.0,213/255.0,1.0});
    
    gradientLayer.colors = @[(__bridge id)color1,(__bridge id)color2,(__bridge id)color3];
    //设置颜色开始位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    //设置颜色结束位置位置
    gradientLayer.endPoint = CGPointMake(1, 1);
    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(colorBackgroundView.frame), CGRectGetHeight(colorBackgroundView.frame));
    [colorBackgroundView.layer addSublayer:gradientLayer];
}

#pragma mark - Action

- (void)back:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
#pragma mark -- UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reusableIdentifier = @"tableView";
    OrderManagerCell* cell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[OrderManagerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIdentifier];
    }
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    return cell;
    
}

#pragma mark - Get

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[OrderManagerCell class] forCellReuseIdentifier:@"tableView"];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 1; i <= 11; i ++) {
            [_dataSource addObject:[NSString stringWithFormat:@"room%d",i]];
        }
    }
    return _dataSource;
}


@end
