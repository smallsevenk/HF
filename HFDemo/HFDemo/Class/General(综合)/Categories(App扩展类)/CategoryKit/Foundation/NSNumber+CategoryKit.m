//
//  NSNumber+CategoryKit.m
//  CategoryKit
//
//  Created by xujun on 15/8/3.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import "NSNumber+CategoryKit.h"
#import "NSString+CategoryKit.h"

@implementation NSNumber (CategoryKit)

//货币格式 88,888.00
+ (NSString *)currencyFormatterToDouble:(double)obj{
    return [NSNumber stringFromDouble:obj];
}

+ (NSString *)currencyFormatterToString:(NSString *)obj{
    if (!obj) {
        return obj;
    }
    obj = [obj stringByReplacingOccurrencesOfString:@"," withString:@""];
    return [NSNumber stringFromDouble:obj.doubleValue];
}

+ (NSString *)stringFromDouble:(double)obj
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setPositiveFormat:@"###,##0.00;"];
    return [nf stringFromNumber:[NSNumber numberWithDouble:obj]];
}


+ (NSNumber *)numberWithString:(NSString *)string {
    NSString *str = [[string stringByTrim] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    
    static NSDictionary *g_NumberDic_;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_NumberDic_ = @{@"true" :   @(YES),
                         @"yes" :    @(YES),
                         @"false" :  @(NO),
                         @"no" :     @(NO),
                         @"nil" :    [NSNull null],
                         @"null" :   [NSNull null],
                         @"<null>" : [NSNull null]};
    });
    NSNumber *num = g_NumberDic_[str];
    if (num) {
        if (num == (id)[NSNull null]) return nil;
        return num;
    }
    
    // hex number
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    // normal number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}


@end
