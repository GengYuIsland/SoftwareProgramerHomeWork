//
//  RootViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "RootViewController.h"
#import "Header.h"
#import "OrderManageViewController.h"
#import "GuestInfoViewController.h"
#import "BusinessStatisticsViewController.h"
#import "GuestHistoryViewController.h"
#import "LoginViewController.h"

@interface RootViewController ()<LeftViewControllerDelegate>

@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"酒店客房管理系统"];

    [self addChildViewController:self.leftViewController];
    [self.view addSubview:self.leftViewController.view];
    [self addChildViewController:self.homeViewController];
    [self.view addSubview:self.homeViewController.view];
    
    [self.leftViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
    }];
    [self.homeViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.mas_equalTo(0);
        make.size.equalTo(self.leftViewController.view);
    }];
    [self.navigationItem setLeftBarButtonItem:self.leftBarButtonItem];
}

#pragma mark - Delegate

- (void)clickedRowAtIndex:(NSIndexPath *)indexPath {
    [self receiveLeftViewController];
    switch (indexPath.row) {
        case 0:{
            OrderManageViewController *orderVC = [[OrderManageViewController alloc] init];
            [self.navigationController pushViewController:orderVC animated:YES];
            break;
        }
        case 1:{
            GuestInfoViewController *infoVC = [[GuestInfoViewController alloc] init];
            [self.navigationController pushViewController:infoVC animated:YES];
           break;
        }
        case 2:{
            BusinessStatisticsViewController *bussinessVC = [[BusinessStatisticsViewController alloc] init];
            [self presentViewController:bussinessVC animated:YES completion:nil];
            break;
        }
        case 3:{
            GuestHistoryViewController *historyVC = [[GuestHistoryViewController alloc] init];
            [self.navigationController pushViewController:historyVC animated:YES];
            break;
        }
        case 4:{
            LoginViewController *loginVC = [LoginViewController new];
            self.view.window.rootViewController = loginVC;
            [self.view.window addSubview:loginVC.view];
            [self.view removeFromSuperview];
            break;
        }
    }
}

#pragma mark - Action

- (void)leftBarButtonAction:(UIButton *)button {
    [self displayLeftViewController];
}

- (void)homeViewTapAction:(UITapGestureRecognizer *)tap {
    [self receiveLeftViewController];
}

- (void)leftPanAction:(UIPanGestureRecognizer *)pan {
//    CGPoint move = [pan translationInView:<#(nullable UIView *)#>]
}

- (void)displayLeftViewController {
    CGFloat leftViewWidth = SCREEN_WIDTH - 100;
    
    if (self.homeViewController.view.frame.origin.x == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.leftViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.right.mas_equalTo(leftViewWidth - SCREEN_WIDTH);
                make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
            }];
            [self.homeViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.leftViewController.view.mas_right);
                make.size.equalTo(self.leftViewController.view);
                make.top.mas_equalTo(0);
            }];
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            [self.navigationController setNavigationBarHidden:finished animated:NO];
        }];
    }
}

- (void)receiveLeftViewController {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.leftViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT));
            make.top.and.right.mas_equalTo(0);
            
        }];
        [self.homeViewController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.leftViewController.view);
            make.left.and.top.mas_equalTo(0);
        }];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [self.navigationController setNavigationBarHidden:!finished animated:YES];
    }];
}

#pragma mark - Get

- (LeftViewController *)leftViewController {
    if (!_leftViewController) {
        _leftViewController = [[LeftViewController alloc] init];
        _leftViewController.delegate = self;
    }
    return _leftViewController;
}

- (HomeViewController *)homeViewController {
    if (!_homeViewController) {
        _homeViewController = [[HomeViewController alloc] init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeViewTapAction:)];
        [_homeViewController.view addGestureRecognizer:tap];
        
        UIPanGestureRecognizer *leftPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftPanAction:)];
        [_homeViewController.view addGestureRecognizer:leftPan];
    }
    return _homeViewController;
}

- (UIBarButtonItem *)leftBarButtonItem {
    if (!_leftBarButtonItem) {
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setBackgroundImage: [UIImage imageNamed:@"openLeft"] forState:UIControlStateNormal];
        backButton.frame = CGRectMake(0,0,28,28);
        [contentView addSubview:backButton];
        [backButton addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    }
    return _leftBarButtonItem;
}
@end
