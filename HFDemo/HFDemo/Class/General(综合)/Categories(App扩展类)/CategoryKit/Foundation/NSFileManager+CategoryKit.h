//
//  NSFileManager+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 15/11/6.
//  Copyright © 2015年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (CategoryKit)

#pragma mark - 路径
+ (NSURL *)mainResourceURL;
+ (NSURL *)documentURL;

@end

NS_ASSUME_NONNULL_END
