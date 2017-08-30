//
//  NSDictionary+Addtions.h
//  HFDemo
//
//  Created by smallsevenk on 2017/6/6.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

//快速获取字符串
- (NSString *)stringByKey:(NSString*)key;

//快速转换jsonstr
- (NSString *)toJsonString;

//快速获取数组
- (NSMutableArray *)arrayByKey:(NSString*)key;

//快速获取字典
- (NSMutableDictionary *)dictionaryByKey:(NSString*)key;

//Dictionary->MutableDictionary
- (NSMutableDictionary *)toMutableDictionary;

@end
