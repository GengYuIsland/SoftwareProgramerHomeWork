//
//  BusinessStatisticsViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "BusinessStatisticsViewController.h"
#import "Header.h"
#import "WSLineChartView.h"

@interface BusinessStatisticsViewController ()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation BusinessStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"业务统计"];
    [self createBGColor];
    
    [self.view addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.bottom.mas_equalTo(-44);
        make.centerX.mas_equalTo(0);
    }];
    
    NSMutableArray *xArray = [NSMutableArray array];
    NSMutableArray *yArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 12; i++) {
        
        [xArray addObject:[NSString stringWithFormat:@"%d",1 + i]];
        [yArray addObject:[NSString stringWithFormat:@"%d",arc4random_uniform(1000)]];
        
    }
    
    WSLineChartView *wsLine = [[WSLineChartView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 200 ) xTitleArray:xArray yValueArray:yArray yMax:1000 yMin:0];
    wsLine.backgroundColor = [UIColor clearColor];
    [self.view addSubview:wsLine];
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

- (void)backAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Get

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}


@end
