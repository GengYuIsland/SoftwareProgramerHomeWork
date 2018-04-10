//
//  HomeViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/10.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "HomeViewController.h"
#import "Header.h"

@interface HomeViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBGColor];
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.bottom.mas_equalTo(-44);
    }];
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

#pragma mark - Get

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeBG"]];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _bgImageView;
}
@end
