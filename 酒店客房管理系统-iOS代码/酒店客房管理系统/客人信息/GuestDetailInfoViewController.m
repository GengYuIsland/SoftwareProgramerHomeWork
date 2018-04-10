//
//  GuestDetailInfoViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "GuestDetailInfoViewController.h"
#import "Header.h"

@interface GuestDetailInfoViewController ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UILabel *idNumberLabel;
@property (nonatomic, strong) UILabel *guestTypeLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) UIButton *backButton;
@end

@implementation GuestDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self.view addSubview:self.headImageView];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.sexLabel];
    [self.view addSubview:self.idNumberLabel];
    [self.view addSubview:self.guestTypeLabel];
    [self.view addSubview:self.addressLabel];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(self.headImageView.mas_bottom).mas_offset(44);
    }];
    [self.sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(44);
    }];
    [self.idNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.sexLabel.mas_bottom).mas_offset(44);
    }];
    [self.guestTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
    
        make.top.mas_equalTo(self.idNumberLabel.mas_bottom).mas_offset(44);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.guestTypeLabel.mas_bottom).mas_offset(44);
    }];
    
    
    [self.view addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.bottom.mas_equalTo(-44);
        make.centerX.mas_equalTo(0);
    }];
}

#pragma mark - Action

- (void)backAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Get

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guestInfoBG"]];
    }
    return _bgImageView;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.infoModel.name]];
    }
    return _headImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];
        _nameLabel.text = [NSString stringWithFormat:@"姓名：%@",self.infoModel.name];
    }
    return _nameLabel;
}

- (UILabel *)sexLabel {
    if (!_sexLabel) {
        _sexLabel = [[UILabel alloc] init];
        _sexLabel.font = [UIFont boldSystemFontOfSize:20];
        _sexLabel.text = [NSString stringWithFormat:@"性别：%@",self.infoModel.sex];
    }
    return _sexLabel;
}

- (UILabel *)idNumberLabel {
    if (!_idNumberLabel) {
        _idNumberLabel = [[UILabel alloc] init];
        _idNumberLabel.font = [UIFont boldSystemFontOfSize:20];
        _idNumberLabel.text = [NSString stringWithFormat:@"身份证号：%@",self.infoModel.idNumber];
    }
    return _idNumberLabel;
}

- (UILabel *)guestTypeLabel {
    if (!_guestTypeLabel) {
        _guestTypeLabel = [[UILabel alloc] init];
        _guestTypeLabel.font = [UIFont boldSystemFontOfSize:20];
        _guestTypeLabel.text = [NSString stringWithFormat:@"客户类型：%@",self.infoModel.guestType];
    }
    return _guestTypeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont boldSystemFontOfSize:20];
        _addressLabel.text = [NSString stringWithFormat:@"地址：%@",self.infoModel.address];
    }
    return _addressLabel;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
@end
