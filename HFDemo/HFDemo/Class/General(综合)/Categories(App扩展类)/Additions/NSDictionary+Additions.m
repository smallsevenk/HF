//
//  NSDictionary+Additions.m
//  Enfry
//
//  Created by Enfry-Zick on 2017/6/6.
//  Copyright © 2017年 enfry. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (NSString *)stringByKey:(NSString*)key
{
    return [self objectForKey:key];
}

- (NSString *)toJsonString
{
    NSData *data=[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSMutableArray *)arrayByKey:(NSString*)key
{
    return [self objectForKey:key];
}

- (NSMutableDictionary *)dictionaryByKey:(NSString*)key
{
    return [self objectForKey:key];
}

- (NSMutableDictionary *)toMutableDictionary
{
    return [[NSMutableDictionary alloc] initWithDictionary:self];
}

@end
