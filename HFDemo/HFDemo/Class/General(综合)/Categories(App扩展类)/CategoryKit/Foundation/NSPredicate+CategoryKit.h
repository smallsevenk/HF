//
//  NSPredicate+CategoryKit.h
//  CategoryKit
//
//  Created by xujun on 15/11/5.
//  Copyright © 2015年 xujun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSPredicate (CategoryKit)

//eg NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF.name LIKE[cd] %@",[NSPredicate predicateLikeIncludeText:text]];
///包含某个字符串...例如  ABCD  包含BC   但是不包含AD
+ (NSString *)predicateLikeContainsText:(NSString *)text;

///包含某个字符串(分散)...例如  ABCD  包含BC   同样也包含AD
+ (NSString *)predicateLikeIncludeText:(NSString *)text;

@end


NS_ASSUME_NONNULL_END