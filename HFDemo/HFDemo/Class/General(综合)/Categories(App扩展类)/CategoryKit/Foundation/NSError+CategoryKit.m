//
//  NSError+CategoryKit.m
//   
//
//  Created by xujun on 5/3/14.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import "NSError+CategoryKit.h"
//#import <EventKit/EventKit.h>

@implementation NSError (CategoryKit)
+ (id)errorWithErrorInf:(NSString *)errorInf
{
    return [NSError errorWithCode:-1 errorInf:errorInf];
}

+ (id)errorWithCode:(NSInteger)code errorInf:(NSString *)errorInf
{
    errorInf = errorInf ? errorInf : @"请求服务器失败, 请重试";
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorInf};
    return [NSError errorWithDomain:errorInf code:code userInfo:userInfo];
}

+ (id)errorWithNetworkErrorCode:(NSInteger)code
{
    NSString *errorInf = @"";
    if (code == kCFURLErrorNotConnectedToInternet) {
        errorInf = @"当前网络状况不佳，请检查网络设置";
    }
    else if (code == kCFURLErrorBadServerResponse) {
        errorInf = @"服务器响应异常";
    }
    else if (code == kCFURLErrorTimedOut) {
        errorInf = @"请求超时，请检查网络设置";
    }
    else {
        errorInf = @"请求服务器失败, 请重试";
    }

    return [NSError errorWithCode:code errorInf:errorInf];
}

@end
