//
//  HFUserDefault.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/29.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HFUserDefault.h"

@implementation HFUserDefault

+ (void)xSaveObject:(id)value forKey:(NSString *)keyName{
    [XUserDefault setObject:SS(value) forKey:SS(keyName)];
    [XUserDefault synchronize];
}

+ (void)xSaveBool:(BOOL)value forKey:(NSString *)keyName{
    [XUserDefault setBool:value forKey:SS(keyName)];
    [XUserDefault synchronize];
}

+ (void)xSaveSelfDefineObject:(id)value forKey:(NSString*)key{
    NSData *userInfo=[NSKeyedArchiver archivedDataWithRootObject:value];
    [self xSaveObject:userInfo forKey:key];
}

+ (id)xSelfObjectForKey:(NSString*)key{
    NSData *data=[XUserDefault objectForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
