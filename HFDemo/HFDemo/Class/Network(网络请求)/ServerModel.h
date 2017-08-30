//
//  ServerModel.h
//  HFDemo
//
//  Created by smallsevenk on 16/12/24.
//  Copyright © 2016年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerModel : NSObject<NSCopying>

@property (nonatomic, strong)   NSString *serverOwner;
@property (nonatomic, strong)   NSString *serverUrl;


- (instancetype)initWithOwner:(NSString*)owner url:(NSString*)url;

@end
