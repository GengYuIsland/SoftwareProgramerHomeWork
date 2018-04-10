//
//  GuestInfoViewController.m
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import "GuestInfoViewController.h"
#import "GuestInfoModel.h"
#import "Header.h"
//#import "GuestDetailInfoViewController.h"

@interface GuestInfoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *sexArray;
@property (nonatomic, strong) NSArray *idNumberArray;
@property (nonatomic, strong) NSArray *guestTypeArray;
@property (nonatomic, strong) NSArray *addressArray;
@end

@implementation GuestInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:@"客人信息"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
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

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

#pragma mark -- UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reusableIdentifier = @"tableView";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIdentifier];
    }
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.textLabel.textColor = RGB(71, 152, 255);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:self.nameArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GuestDetailInfoViewController *detailVC = [GuestDetailInfoViewController new];
    detailVC.infoModel = self.dataSource[indexPath.row];
//    detailVC.pushtype = self.pushtype;
    [self presentViewController:detailVC animated:YES completion:nil];
}

#pragma mark - Get

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableView"];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
        for (int i = 0; i < self.nameArray.count; i ++) {
            GuestInfoModel *model = [GuestInfoModel new];
            model.name = self.nameArray[i];
            model.sex = self.sexArray[i];
            model.idNumber = self.idNumberArray[i];
            model.guestType = self.guestTypeArray[i];
            model.address = self.addressArray[i];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}

- (NSArray *)nameArray {
    return @[@"李易峰",
             @"霍建华",
             @"范冰冰",
             @"唐嫣",
             @"鹿晗",
             @"赵丽颖",
             @"张柏芝",
             @"杨洋"
             ];
}

- (NSArray *)sexArray {
    return @[@"男",
             @"男",
             @"女",
             @"女",
             @"男",
             @"女",
             @"女",
             @"男"
             ];
}

- (NSArray *)idNumberArray {
    return @[@"13022546553",
             @"14672443553",
             @"19282928553",
             @"13022443553",
             @"13022443029",
             @"13025543553",
             @"11032345453",
             @"13022255753",];
}

- (NSArray *)guestTypeArray {
    return @[@"VIP",
             @"普通顾客",
             @"VIP",
             @"VIP",
             @"普通顾客",
             @"VIP",
             @"普通顾客",
             @"普通顾客"];
}

- (NSArray *)addressArray {
    return @[@"东北大砍省",
             @"马鞍山艺术团",
             @"二人转广场",
             @"哇哈哈老年活动中心",
             @"杭州电子科大",
             @"浙江理工大学",
             @"浙江财经大学",
             @"浙江大学"];
}

@end
