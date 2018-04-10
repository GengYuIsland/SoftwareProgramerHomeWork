//
//  GuestHistoryViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "GuestHistoryViewController.h"
#import "GuestInfoViewController.h"

@interface GuestHistoryViewController ()
@property (nonatomic, strong) GuestInfoViewController *guestVC;
@end

@implementation GuestHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"客史档案"];
    [self addChildViewController:self.guestVC];
    [self.view addSubview:self.guestVC.view];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"nav_back"]forState:UIControlStateNormal];
    backButton.frame=CGRectMake(0,0,28,28);
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

#pragma mark - Action

- (void)back:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Get

- (GuestInfoViewController *)guestVC {
    if (!_guestVC) {
        _guestVC = [[GuestInfoViewController alloc] init];
    }
    return _guestVC;
}
@end
