//
//  ServerModel.m
//  ENPlus
//
//  Created by Enfry-Zick on 16/12/24.
//  Copyright © 2016年 Enfry-Zick. All rights reserved.
//

#import "ServerModel.h"

@implementation ServerModel

- (instancetype)initWithOwner:(NSString*)owner url:(NSString*)url{
    if (self = [super init]) {
        self.serverOwner = owner;
        self.serverUrl = url;
    }
    return  self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder

{
    
    [aCoder encodeObject:self.serverOwner forKey:@"serverOwner"];
    
    [aCoder encodeObject:self.serverUrl forKey:@"serverUrl"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder

{
    
    self = [super init];
    
    if (self) {
        
        self.serverOwner = [aDecoder decodeObjectForKey:@"serverOwner"];
        
        self.serverUrl = [aDecoder decodeObjectForKey:@"serverUrl"];
        
    }
    
    return self;
    
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone{
    
    ServerModel *model = [[ServerModel alloc]init];
    
    model.serverOwner = self.serverOwner;
    
    model.serverUrl = self.serverUrl;
    
    return model;
    
}
 

@end
