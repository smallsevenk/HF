//
//  UIButton+Additions.h
//  Kurrent
//
//  Created by liangpingxian on 15/7/29.
//  Copyright (c) 2015年 Kurrent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

//上图片  下文字  button
+ (UIButton *)upImageDownTitleButtonWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title;

+ (UIButton *)buttonWithImage:(NSString *)aImage;

+ (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)aImage;

- (void)setTitle:(NSString *)title image:(NSString *)aImage;



//点击不改变
+ (UIButton *)buttonWithState:(NSString *)title image:(NSString *)image Color:(UIColor *)color;
//背景图片
+ (UIButton *)buttonWithImage:(NSString *)aImage bImage:(NSString *)bImage;
+ (UIButton *)buttonWithImage:(NSString *)title finishedSelectedImage:(NSString *)finishedSelectedImage finishedUnselectedImage:(NSString *)finishedUnselectedImage;
+ (UIButton *)buttonWithCenterImage:(NSString *)aImage frame:(CGRect)frame;

+ (UIButton *)buttonWithImage:(NSString *)aImage title:(NSString *)title;
//左图片右文字
+ (UIButton *)buttonWithImageTitle:(NSString *)leftImage title:(NSString *)title frame:(CGRect)frame;
//左文字右图
+ (UIButton *)buttonWithTitleImage:(NSString *)leftImage title:(NSString *)title frame:(CGRect)frame;
//上图片下文字
+ (UIButton *)buttonWithUpImageNextTilte:(NSString *)imagePath title:(NSString *)title frame:(CGRect)frame;
//圆角边框回复按钮
+ (UIButton *)buttonWithComments:(CGRect)frame;
//圆角按钮
+ (id)buttonWithFillet:(NSString *)title frame:(CGRect)frame;
+ (id)buttonWithFillet:(NSString *)title frame:(CGRect)frame titleColor:(UIColor *)color mode:(UIControlContentHorizontalAlignment)mode;

+ (id)buttonWithFillet:(NSString *)aImage title:(NSString *)title frame:(CGRect)frame;
//提示框，蓝色按钮
+ (id)buttonFont;



@end
