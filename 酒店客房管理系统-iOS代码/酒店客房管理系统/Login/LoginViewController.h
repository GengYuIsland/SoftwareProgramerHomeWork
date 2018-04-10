//
//  LoginViewController.h
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/10.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STLVideoViewController.h"

typedef NS_ENUM(NSInteger, JxbLoginShowType) {
    JxbLoginShowType_NONE,
    JxbLoginShowType_USER,
    JxbLoginShowType_PASS
};

@interface LoginViewController : STLVideoViewController

@end
