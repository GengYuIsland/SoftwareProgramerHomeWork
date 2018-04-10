//
//  Header.h
//  酒店客房管理系统
//
//  Created by Shadow on 2017/12/10.
//  Copyright © 2017年 shadow2017. All rights reserved.
//

#ifndef Header_h
#define Header_h

//import header files
#import "Masonry.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>
#import "SDCycleScrollView.h"
#import "SVProgressHUD.h"


//size
//NavBar高度
#define NavigationBar_HEIGHT 44
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define FACE375(x)  x/375.0 * SCREEN_WIDTH

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)


//对blcok weakSelf的缩写
#define weakSelf(weakSelfName) __weak typeof(self) weakSelfName = self;
#define weakClass(weakClassName, weakObj) __weak typeof(weakObj) weakClassName = weakObj;
#define strongSelf(strongSelfName) __strong typeof(self) strongSelfName = self;

#endif /* Header_h */
