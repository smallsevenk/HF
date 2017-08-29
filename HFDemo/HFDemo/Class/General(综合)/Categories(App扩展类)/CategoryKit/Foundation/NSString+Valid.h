//
//  NSString+Valid.h
//  CategoryKit
//
//  Created by xujun on 15/9/4.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Valid)
///是否全是空格
- (BOOL)isAllSpaceString;
///whitespaceCharacterSet
- (BOOL)isEmptyOrWhitespace;

///合法身份证
- (BOOL)isValidPersonIDCardNumber;

///银行卡校验规则(Luhn算法)
- (BOOL)isValidBankCardNumber;

/// 是否是是航班号  车次号
- (BOOL)isFlightOrTrainNumber;

///是否全部是数字
- (BOOL)isNumber;

/// 是否全部数字和字母组成
- (BOOL)isAlphanumeric;

///中文 字母等
- (BOOL)isChinese;
- (BOOL)isChineseAlphabet;
///手机号码
- (BOOL)isValidMobileNumber;
///邮箱地址
- (BOOL)isValidEmailAddress;
///网页html
- (BOOL)isValidHtmlURL;
///合法密码
- (BOOL)isValidPassword;
///合法IP地址
- (BOOL)isValildIPAddress;
///合法IP端口
- (BOOL)isValidIPPort;

////#if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0)
//#if kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iPhoneOS_8_0
//- (BOOL)containsString:(NSString *)str;
//#endif

#pragma mark -textField
///合法金额输入...用于textField  delegate
- (BOOL)isValidMoneyWithRange:(NSRange)range replacementString:(NSString *)string;
///判断text 最大长度 maxLength = 0 return YES
- (BOOL)isValidMaxLength:(NSUInteger)maxLength withRange:(NSRange)range replacementString:(NSString *)string;

@end


NS_ASSUME_NONNULL_END

