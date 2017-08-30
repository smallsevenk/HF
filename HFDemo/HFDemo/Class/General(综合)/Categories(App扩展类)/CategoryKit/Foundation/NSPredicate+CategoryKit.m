//
//  NSPredicate+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 15/11/5.
//  Copyright © 2015年 HappinessFamily. All rights reserved.
//

#import "NSPredicate+CategoryKit.h"

@implementation NSPredicate (CategoryKit)

///包含某个字符串...例如  ABCD  包含BC   但是不包含AD
+ (NSString *)predicateLikeContainsText:(NSString *)text
{
    return [NSPredicate predicateLikeFormatTextWithText:text onlyContains:YES];
}


///包含某个字符串(分散)...例如  ABCD  包含BC   同样也包含AD
+ (NSString *)predicateLikeIncludeText:(NSString *)text
{
    return [NSPredicate predicateLikeFormatTextWithText:text onlyContains:NO];
}


+ (NSString *)predicateLikeFormatTextWithText:(NSString *)text onlyContains:(BOOL)onlyContains
{
    //中文括号 crash （ ）＊
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
    
    NSMutableString *str = [NSMutableString new];
    for (NSUInteger index = 0; index <text.length; ++index) {

        NSString *ch = [text substringWithRange:NSMakeRange(index, 1)];

        if (!onlyContains) {
            [str appendString:@"*"];
        }
        
        //LIKE 通配符
        if ([ch isEqualToString:@"*"] || [ch isEqualToString:@"?"]) {
            [str appendString:[NSString stringWithFormat:@"\\%@",ch]];
        }
        else {
            [str appendString:ch];
        }
        
        //最后一个
        if (!onlyContains && index == text.length - 1) {
            [str appendString:@"*"];
        }
    }
    
//    if (str.length > 0) {
//        [str insertString:@"\'" atIndex:0];
//        [str appendString:@"\'"];
//    }
    
    return str;
}

@end
