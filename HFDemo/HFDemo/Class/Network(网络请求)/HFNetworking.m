//
//  ZZNetWorking.m
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/16.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HFNetworking.h"
#import "AFNetworking.h"
#import "ApiMacro.h"
#import "ChangeServerVC.h"

@implementation HFNetworking

#pragma mark 封装的请求方法

//完整URL方式
+ (void)requestWithBaseUrl:(NSString *)baseUrl
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock
{
    [HFNetworking requestWithBaseUrl:baseUrl
                             apiName:nil
                          parameters:nil
                                type:HttpRequestTypePost
                       responseBlock:responseBlock];
}

//默认POST
+ (void)requestWithApiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
             responseBlock:(ResponseBlock)responseBlock
{
    [HFNetworking requestWithApiName:apiName
                          parameters:parameters
                                type:HttpRequestTypePost
                       responseBlock:responseBlock];
}

//公共参数方式+默认BaseUrl
+ (void)requestWithApiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock
{
    NSDictionary *para = parameters;
    
    if (para && para.count > 0)
    {
        para = [ResponseInfo addCommomPostDictionary:parameters];
    }
    
    [HFNetworking requestWithBaseUrl:[ChangeServerVC basicSever].serverUrl
                             apiName:apiName parameters:para
                                type:HttpRequestTypePost
                       responseBlock:responseBlock];
}

//完整参数方式
+ (void)requestWithBaseUrl:(NSString *)baseUrl
                   apiName:(NSString *)apiName
                parameters:(NSDictionary *)parameters
                      type:(HttpRequestType)type
             responseBlock:(ResponseBlock)responseBlock
{
    NSString *urlStr = baseUrl;
    
    if (baseUrl)
    {
        urlStr = [baseUrl addString:apiName];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.0f;
    
    SuccessBlock successBlock = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        
        NSError *error = nil;
        
//        NSString*result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        ResponseInfo *data = [ResponseInfo dataWithResponseJson:jsonDic error:&error];
        
        [HFNetworking debugShowRequestUrl:urlStr parameters:parameters];
        
        if (responseBlock) {
            
            if(data.code == ErrorCodeNormal){
                responseBlock(YES,data,error);
            }
            else {
                responseBlock(NO,data,error);
            }
        }
    };
    
    FailBlock failBlock = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        
        error = [NSError errorWithNetworkErrorCode:error.code];
        
        ResponseInfo *data = [ResponseInfo dataWithNetworkError:error];
        
        [HFNetworking debugShowRequestUrl:urlStr parameters:parameters];
        
        responseBlock(NO,data,error);
    };
    
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:urlStr parameters:parameters progress:nil success:successBlock failure:failBlock];
        }
            break;
            
        case HttpRequestTypePost:
        {
            [manager POST:urlStr parameters:parameters progress:nil success:successBlock failure:failBlock];
        }
            break;
            
        default:
            break;
    }
}

+ (void)debugShowRequestUrl:(NSString *)url parameters:(NSDictionary *)parameters
{
#ifdef DEBUG
    NSLog(@"\n---请求URL---:\n%@\n---------",[HFNetworking requestURLWithBaseURL:url params:parameters]);
#endif
}

///请求地址路径
+ (NSString *)requestURLWithBaseURL:(NSString *)baseURL params:(NSDictionary *)params

{
    NSString *aString = AFQueryStringFromParameters(params);
    
    return [NSString stringWithFormat:@"%@?%@",baseURL ? : @"",aString];
}


+ (void)debugWithLogURL:(NSString *)url parameters:(NSDictionary *)parameters beginTimeInterval:(NSTimeInterval)beginTimeInterval responseData:(ResponseInfo *)responseData error:(NSError *)error
{
#ifdef DEBUG
    //printf("接口:%s\n 传入参数:%s\n 返回内容:%s\n",[relativeURL UTF8String],[parameters.description UTF8String],[responseObject.description UTF8String]);
    //    NSString *other = [RequestCommomData share].serviceURL;
    //    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate]-beginTimeInterval;
    //
    //
    //    NSString *result = [NSString stringWithFormat:@"msgType:%@ errorInf:%@",responseData.msgType,error.domain.length>0?error.domain:@"无"];
    //
    //    NSLog(@"\n\n---------------完美的分割线---------------\n\
    //          1.接口:%@\n\
    //          2.IP:%@\n\
    //          3.耗时:%f秒\n\
    //          4.传入参数:\n%@\n\
    //          5.返回内容:\n%@\n\
    //          ---------------完美的分割线---------------\n",url,other,time,parameters,result);
#endif
    
}

@end

