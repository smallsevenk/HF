//
//  ResponseInfo.m
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/16.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "ResponseInfo.h"

@implementation ResponseInfo

+ (instancetype)dataWithResponseJson:(NSDictionary *)jsonDic error:(NSError **)error
{
    ResponseInfo *data = [ResponseInfo mj_objectWithKeyValues:jsonDic];
    
    if (!data && [jsonDic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    data.rspCode = [jsonDic objectForKey:@"resultcode"];
    data.rspData = [jsonDic objectForKey:@"result"];
    data.rspMsg = [jsonDic objectForKey:@"reason"];
    data.code = [data isValidResponseJsonWithError:error];
    
    return data;
}

- (ZZNetErrorCode)isValidResponseJsonWithError:(NSError **)error
{
    ZZNetErrorCode code = ErrorCodeUnknwon;
    
    if ([self.rspCode isEqualToString:@"200"]) {
        code = ErrorCodeNormal;
    }
    else {
        code = ErrorCodeError;
    }
    
    //可能以后还有 token 过期
    //接口调用失败
    if (code == ErrorCodeUnknwon) {
        if (error) {
            *error = [NSError errorWithErrorInf:@"接口调用失败，请稍后重试"];
        }
        return code;
    }
    
//    if ([_rspCode isEqualToString:@"AP3001"] || [_rspCode isEqualToString:@"AK3010"]) {
//        code = ENJsonErrorCodeKicked;
//    }
//    else if ([_rspCode isEqualToString:@"AP5000"]) {
//        code = ENJsonErrorCodeTokenInvalid;
//    }
   
    
    //rspCode
    if (error) {
        *error = [NSError errorWithCode:-1 errorInf:SS(self.rspMsg)];
    }
    
    return code;
}

+ (instancetype)dataWithNetworkError:(NSError *)error
{
    ResponseInfo *data = [ResponseInfo new];
    data.rspMsg = error.domain ? error.domain : error.localizedDescription;
    data.code = ErrorCodeNetworkError;
    return data;
}


+ (NSDictionary *)addCommomPostDictionary:(NSDictionary *)postDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
//    NSDateFormatter *dt = [[NSDateFormatter alloc] init];
//    [dt setDateFormat:@"yyyyMMddHHmmss"];
//    NSString *currTime = [dt stringFromDate:[NSDate date]];
//    [dict setObject:xApi_appKey forKey:@"key"];
//    [dict setObject:@"IOS" forKey:@"channelType"];
//    [dict setObject:[NSString stringWithUUID] forKey:@"machineCode"];
//    [dict setObject:[NSString getMyApplicationVersion] forKey:@"appVersion"];
//    [dict setObject:[NSString getBundleID] forKey:@"iOSBundleId"];
//    [dict setObject:currTime forKey:@"curTime"];
//    
//    if (postDictionary) {
//        [dict addEntriesFromDictionary:postDictionary];
//    }
//    
//    NSString *account = @"";
//    NSString *password = @"";
//    if([LoginManager isLogin]){
//        
//        [[UserInfo loginInfo] readPlainPassword];
//        account = [UserInfo loginInfo].username;
//        password = [UserInfo loginInfo].password;
//    }else{
//        account = postDictionary[@"account"];
//        password = postDictionary[@"password"];
//    }
//    
//    ///为空是不对的
//    [dict setObject:ENSS(account) forKey:@"account"];
//    [dict setObject:ENSS(password) forKey:@"password"];
//    
//    NSString *checkStr = [ENSF(@"%@%@%@",xApi_appSecret,ENSS(account),currTime) md5];
//    [dict setObject:checkStr forKey:@"checkStr"];
    
    
    return dict;
}



@end
