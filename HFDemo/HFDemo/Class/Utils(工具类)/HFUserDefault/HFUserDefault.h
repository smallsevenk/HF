//
//  HFUserDefault.h
//  HFDemo
//
//  Created by smallsevenk on 2017/8/29.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XUserDefault [NSUserDefaults standardUserDefaults]

@interface HFUserDefault : NSObject 

+ (void)xSaveObject:(id)value forKey:(NSString *)keyName;

+ (void)xSaveBool:(BOOL)value forKey:(NSString *)keyName;

+ (void)xSaveSelfDefineObject:(id)value forKey:(NSString*)key;

+ (id)xSelfObjectForKey:(NSString*)key;
@end
