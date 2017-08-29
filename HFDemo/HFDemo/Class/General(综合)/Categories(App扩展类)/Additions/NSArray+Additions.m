//
//  NSArray+Addtions.m
//  Enfry
//
//  Created by Enfry-Zick on 2017/6/6.
//  Copyright © 2017年 enfry. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (NSString *)stringByIndex:(NSInteger)index
{
    return [self objectOrNilAtIndex:index];
}

- (NSString *)toJsonString
{
    NSData *data=[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSMutableArray *)arrayByIndex:(NSInteger)index
{
    return [self objectOrNilAtIndex:index];
}

- (NSMutableDictionary *)dictionaryByIndex:(NSInteger)index
{
    return [self objectOrNilAtIndex:index];
}

- (NSMutableArray *)toMutableArray
{
    return [[NSMutableArray alloc] initWithArray:self];
}

@end
