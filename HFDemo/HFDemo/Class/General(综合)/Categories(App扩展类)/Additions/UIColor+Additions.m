//
//  UIColor+Additions.m
//  Enfry
//
//  Created by liangpingxian on 2017/4/11.
//  Copyright © 2017年 enfry. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)


+ (UIColor *)navigationBarColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)navigationBarDarkColor
{
    return [UIColor darkBlueColor_0590c4];
}

///视图背景颜色
+ (UIColor *)viewBackgroundColor
{
    return RGB(245, 245, 245);
}

////搜索框背景颜色
+ (UIColor *)searchBarBackgroundColor
{
    return [self viewBackgroundColor];//;RGBA(222, 222, 222, 1);
}

+ (UIColor *)separatorLineColor
{
    return RGB(230, 230, 230);
}

///placeholderColor cdcdcd
+ (UIColor *)placeholderColor
{
    return RGBHex(@"cdcdcd");
}


+ (UIColor *)lightBlueColor_12b7f5//浅蓝色
{//12b7f5
    return RGB(18, 183, 245);
}
+ (UIColor *)darkBlueColor_0590c4//深蓝色
{//0590c4
    return RGB(5, 144, 196);
}

+ (UIColor *)greenColor_88d142//绿色 88d142
{
    return RGBHex(@"88d142");
}
+ (UIColor *)blackColor_000000 //黑色 (文本颜色)
{//未核对
    return [self blackColor];
}

+ (UIColor *)darkGrayColor_606060//深灰色 (文本颜色)
{
    return RGBHex(@"606060");
}
///灰色 848484
+ (UIColor *)grayColor_848484
{
    return RGBHex(@"848484");
}

//灰色线条
+ (UIColor *)lineGrayColor_e8e8e8
{
    return RGBHex(@"e8e8e8");
}

///更深深灰色 (文本颜色) 333333
+ (UIColor *)darkGrayMoreColor_333333
{
    return RGBHex(@"333333");
}

+ (UIColor *)lightGrayColor_aeaeae//浅灰色 (文本颜色)
{
    return RGBHex(@"aeaeae");
}
+ (UIColor *)lightMoreGrayColor_cdcdcd//更浅的灰色 (文本颜色)
{
    return RGBHex(@"cdcdcd");
}

+ (UIColor *)tbBgGrayColor
{
    return RGBHex(@"f7f7f7");
}

+ (UIColor *)redColor_f35d5e//红色
{//f35d5e
    return RGB(243, 93, 94);
}

///橘黄色  cd8353
+ (UIColor *)darkOrangeColor_cd8353
{
    return RGBHex(@"cd8353");
}

+ (UIColor *)orangeColor_f88529
{
    return RGBHex(@"f88529");
}
///橘红色  ff5921
+ (UIColor *)orangeRedColor_ff5921
{
    return RGBHex(@"ff5921");
}


+ (UIColor *)blueGrayColor_74ace9
{
    return RGBHex(@"74ace9");
}

+ (UIColor *)purpleColor_b985cf
{
    return RGBHex(@"b985cf");
}

+ (UIColor *)randomColor
{
    return  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

@end
