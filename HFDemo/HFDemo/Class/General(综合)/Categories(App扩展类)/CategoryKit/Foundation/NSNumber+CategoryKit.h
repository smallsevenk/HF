//
//  NSNumber+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 15/8/3.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (CategoryKit)
///货币格式 88,888.00
+ (NSString *)currencyFormatterToDouble:(double)obj;

+ (NSString *)currencyFormatterToString:(NSString *)obj;

/**
 Creates and returns an NSNumber object from a string.
 Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "...
 
 @param string  The string described an number.
 
 @return an NSNumber when parse succeed, or nil if an error occurs.
 */
+ (nullable NSNumber *)numberWithString:(NSString *)string;

@end



NS_ASSUME_NONNULL_END
