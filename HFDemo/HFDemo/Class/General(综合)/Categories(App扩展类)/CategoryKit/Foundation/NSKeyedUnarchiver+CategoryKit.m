//
//  NSKeyedUnarchiver+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 15/7/29.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import "NSKeyedUnarchiver+CategoryKit.h"


@implementation NSKeyedUnarchiver (CategoryKit)

+ (id)unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception {
    id object = nil;
    @try {
        object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *e)
    {
        if (exception) *exception = e;
    }
    @finally
    {
    }
    return object;
}

+ (id)unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception {
    id object = nil;
    
    @try {
        object = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    @catch (NSException *e)
    {
        if (exception) *exception = e;
    }
    @finally
    {
    }
    return object;
}

@end
