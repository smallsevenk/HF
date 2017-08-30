//
//  NSString+Additions.h
//  HFDemo
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,kCalucateWay)
{
    kCalucateWayAdding,//加
    kCalucateWaySubtracting,//减
    kCalucateWayMultiplying,//乘
    kCalucateWayDividing,//除
};

@interface NSString (Additions)
/*
 123456789
 
 123,456,789
 
 ￥123,456,789.00
 
 -539,222,988%
 
 1.23456789E8
 
 一亿二千三百四十五万六千七百八十九
 */

//数字的格式化（金额千分位格式化显示）
- (NSString*)kToFinancialTypeByStyle:(NSNumberFormatterStyle)style;

//千分符字符串
- (NSString*)kToFinancialType;

//保留2位小数 只返回正数
- (NSString*)kKeepTwoDecimal;

//把千分分隔数字去掉，
- (NSString *)removeCommaForMicrometerString;

//删除空白字符串
- (NSString *)removeWhiteSpacesFromString;

//
- (NSUInteger)countNumberOfWords;


//数字转汉子
+(NSString *)arabicNumeralsToChinese:(int)number;

//字符串追加
- (NSString *)addString:(NSString *)string;



//移除字符串
- (NSString *)removeSubString:(NSString *)subString;


//替换字符串
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;



//以下标截取字符串
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;

- (NSString*)safeSubStringTo:(NSInteger)index;

- (NSString*)safeSubStringFrom:(NSInteger)index;

//以起始字符串截取字符串
- (NSString *)getAmongStringFrom:(NSString*)begin to:(NSString*)end;

//获取某一字符串位置
- (NSInteger)subStringLocation:(NSString*)subStr;

//获取字符串中重复的字符的rang
- (NSMutableArray *)getRepeatCharRangeBySearchChar:(NSString *)searchChar;

//数组以xx字符串拼接
+ (NSString *)getStringFromArray:(NSArray *)array withJoinedString:(NSString*)joinedString;



//获取app版本号字符串
+ (NSString *)getMyApplicationVersion;


//获取app BundleID
+(NSString*) getBundleID;

//获取app名称
+ (NSString *)getMyApplicationName;



//字符串转data
- (NSData *)convertToData;


//data转字符串
+ (NSString *)getStringFromData:(NSData *)data;


//ULinx时间转当地时间
- (NSString*)revertULinxTime;

//时间用什么分开
- (NSString*)revertULinxTimeWith:(NSString*)separated;

//融亿图文直播时间显示
- (NSString*)revertRYTVULinxTime;

- (NSString*)revertYFLTime;

- (NSDate*)toDate;

- (NSDate*)toDateByFormater:(NSString*)fm;

//UUID
+ (NSString*) uniqueString;



//url转码
- (NSString*) urlEncodedString;



//url解码
- (NSString*) urlDecodedString;


//字符串加密
- (NSString *)sha1;
- (NSString *)md5;



//空白
-(BOOL)isBlank;


//有效字符串
-(BOOL)isValid;


//有效的邮件
- (BOOL)isValidEmail;

//有效的身份证
- (BOOL)isValidIdCard;

//有效的电话号码
- (BOOL)isVAlidPhoneNumber;

//有效的QQ号码
- (BOOL)isVAlidQQNumber;

//有效的url
- (BOOL)isValidUrl;

//有效的银行卡
-(BOOL)isValidBankCard;

//有效的护照
-(BOOL)isValidPassport;

//港澳通行证
-(BOOL)isValidHKAMPassPort;

//台胞证
-(BOOL)isValidTaiWanPassPort;


-(BOOL)isInFuture;


//常规密码格式  字母/数字  最小位数-最大位数
- (BOOL)isPasswordWithMinCharLength:(int)minCL maxCharLength:(int)maxCL;



//常规用户名格式 中文/字母/数字
- (BOOL)isValidUserName;



//只包含字母
- (BOOL)containsOnlyLetters;



//只包含数字
- (BOOL)containsOnlyNumbers;



//只包含字母和数字
- (BOOL)containsOnlyNumbersAndLetters;






//数组是否包含该字符串
- (BOOL)isInThisarray:(NSArray*)array;



//包含该字符串
- (BOOL)containsString:(NSString *)subString;



//该字符串打头
- (BOOL)isBeginWith:(NSString *)string;



//该字符串结束
- (BOOL)isEndWith:(NSString *)string;


- (NSDictionary *)jsonStringToDictionary;


//超过x个字符长度打...
- (NSString *)subStringMaxLength:(NSInteger)len;

#pragma mark 货币计算 2个数
+ (NSString *)decimalNumberCalucate:(NSString *)originValue1 originValue2:(NSString *)originValue2 calucateWay:(kCalucateWay)calucateWay;

//多个数连续做相同操作
+ (NSString *)decimalNumberCalucate:(NSArray*)addValues calucateWay:(kCalucateWay)calucateWay;

@end
