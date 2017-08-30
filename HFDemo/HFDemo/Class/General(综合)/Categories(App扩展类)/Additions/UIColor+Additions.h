//
//  UIColor+Additions.h
//  HFDemo
//
//  Created by smallsevenk on 2017/4/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

///导航栏颜色
+ (UIColor *)navigationBarColor;
+ (UIColor *)navigationBarDarkColor;

///视图背景颜色
+ (UIColor *)viewBackgroundColor;
////搜索框背景颜色
+ (UIColor *)searchBarBackgroundColor;
///分割线颜色
+ (UIColor *)separatorLineColor;
///placeholderColor cdcdcd
+ (UIColor *)placeholderColor;

#pragma mark - 具体颜色
///浅蓝色 12b7f5
+ (UIColor *)lightBlueColor_12b7f5;
///深灰色 (文本颜色) 606060
+ (UIColor *)darkGrayColor_606060;
///灰色 848484
+ (UIColor *)grayColor_848484;
//灰色线条
+ (UIColor *)lineGrayColor_e8e8e8;
///更深深灰色 (文本颜色) 333333
+ (UIColor *)darkGrayMoreColor_333333;
///浅灰色 (文本颜色) aeaeae
+ (UIColor *)lightGrayColor_aeaeae;
///更浅的灰色 (文本颜色) cdcdcd
+ (UIColor *)lightMoreGrayColor_cdcdcd;
//f7f7f7
+ (UIColor *)tbBgGrayColor;
 


#pragma mark -随机颜色
///随机颜色
+ (UIColor *)randomColor;

@end
