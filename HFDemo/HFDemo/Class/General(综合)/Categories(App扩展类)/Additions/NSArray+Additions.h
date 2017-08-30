//
//  NSArray+Addtions.h
//  HFDemo
//
//  Created by smallsevenk on 2017/6/6.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

//快速从数组中获取字符串
- (NSString *)stringByIndex:(NSInteger)index;

//快速转换jsonstr
- (NSString *)toJsonString;

//快速从数组中获取数组
- (NSMutableArray *)arrayByIndex:(NSInteger)index;

//快速从数组中获取字典
- (NSMutableDictionary *)dictionaryByIndex:(NSInteger)index;

//Array->MutableArray
- (NSMutableArray *)toMutableArray;

@end
