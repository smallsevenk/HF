//
//  NSFileManager+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 15/11/6.
//  Copyright © 2015年 HappinessFamily. All rights reserved.
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
