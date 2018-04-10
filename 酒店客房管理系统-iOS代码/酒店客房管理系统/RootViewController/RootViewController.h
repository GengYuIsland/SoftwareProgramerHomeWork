//
//  RootViewController.h
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/13.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "HomeViewController.h"

@interface RootViewController : UIViewController

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) LeftViewController *leftViewController;
@property (nonatomic, strong) HomeViewController *homeViewController;

@end
