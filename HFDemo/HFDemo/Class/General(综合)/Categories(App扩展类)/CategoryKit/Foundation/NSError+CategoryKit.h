//
//  NSError+CategoryKit.h
//   
//
//  Created by smallsevenk on 5/3/14.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CommomError [NSError errorWithCode:error.code]


NS_ASSUME_NONNULL_BEGIN


@interface NSError (CategoryKit)

//domain &&  Description
+ (NSError *)errorWithErrorInf:(NSString *)errorInf;
//domain &&  Description
+ (NSError *)errorWithCode:(NSInteger)code errorInf:(NSString *)errorInf;

//自动识别  CFNetworkErrors
+ (NSError *)errorWithNetworkErrorCode:(NSInteger)code;
@end


NS_ASSUME_NONNULL_END
