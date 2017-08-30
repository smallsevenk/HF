//
//  UILabel+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 8/30/14.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UILabel (CategoryKit)

///默认计算 多行模式
- (CGFloat)textHeightForWidth:(CGFloat)width NS_AVAILABLE_IOS(6_0);
///默认计算 多行模式 和  label的Width
- (CGFloat)textHeight NS_AVAILABLE_IOS(6_0);
///默认计算 单行模式
- (CGFloat)textWidth NS_AVAILABLE_IOS(6_0);

///去掉 尾部回车换行
- (void)setRemoveEndNewLineCharText:(NSString *)text;

@end



NS_ASSUME_NONNULL_END
