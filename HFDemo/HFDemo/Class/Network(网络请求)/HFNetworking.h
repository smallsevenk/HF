//
//  HFNetWorking.h
//  BBGWallet
//
//  Created by smallsevenk on 2017/8/16.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ResponseInfo.h"

/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 1,
    /**
     *  post请求
     */
    HttpRequestTypePost = 2
};

@interface HFNetworking : NSObject

//完整URL方式
+ (void)requestWithBaseUrl:(NSString *)baseUrl
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock;

//默认Post方式
+ (void)requestWithApiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
             responseBlock:(ResponseBlock)responseBlock;

//公共参数方式+默认BaseUrl
+ (void)requestWithApiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock;

//完整参数方式
+ (void)requestWithBaseUrl:(NSString *)baseUrl
                   apiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock;
 

@end

