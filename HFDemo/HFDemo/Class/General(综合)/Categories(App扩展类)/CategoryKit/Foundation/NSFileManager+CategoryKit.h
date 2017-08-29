//
//  NSFileManager+CategoryKit.h
//  CategoryKit
//
//  Created by xujun on 15/11/6.
//  Copyright © 2015年 xujun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (CategoryKit)

#pragma mark - 路径
+ (NSURL *)mainResourceURL;
+ (NSURL *)documentURL;

@end

NS_ASSUME_NONNULL_END
