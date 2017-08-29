//
//  NSFileManager+CategoryKit.m
//  CategoryKit
//
//  Created by xujun on 15/11/6.
//  Copyright © 2015年 xujun. All rights reserved.
//

#import "NSFileManager+CategoryKit.h"

@implementation NSFileManager (CategoryKit)

+ (NSURL *)mainResourceURL
{
    return [[NSBundle mainBundle] resourceURL];
}

+ (NSURL *)documentURL
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return url;
}


@end
