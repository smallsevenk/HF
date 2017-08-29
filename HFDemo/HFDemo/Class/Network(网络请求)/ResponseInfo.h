//
//  ResponseInfo.h
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/16.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSURLSessionDataTask * task, id responseObject);
typedef void(^FailBlock)(NSURLSessionDataTask *task, NSError *error);

typedef void(^ResponseBlock)(BOOL isOK, id  data, NSError *error);

typedef NS_ENUM(NSInteger, ZZNetErrorCode) {
    ErrorCodeUnknwon                      = 0, //未知错误类型
    ErrorCodeNormal                       = 1,//正常
    ErrorCodeError                        = 2,//错误
    ErrorCodeJavaServerError              = 6,//服务器处理异常，请联系管理员
    ErrorCodeNetworkError                 = 100,//网络错误
};

@interface ResponseInfo : NSObject
 
@property (nonatomic,strong) NSString *rspCode;//响应码 000000：正常 其他为错误码
@property (nonatomic,strong) NSString *rspMsg;
@property (nonatomic,assign) long long rspTime; //服务器时间
//@property (nonatomic,strong) NSDictionary *userInfo;
@property (nonatomic,strong) id rspData;//响应数据 (字典 或者 数组
@property (nonatomic,assign) ZZNetErrorCode code;

+ (instancetype)dataWithResponseJson:(NSDictionary *)jsonDic error:(NSError **)error;

+ (instancetype)dataWithNetworkError:(NSError *)error;

+ (NSDictionary *)addCommomPostDictionary:(NSDictionary *)postDictionary;

@end
