//
//  HomeVM.m
//  HFDemo
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeVM.h"

@implementation HomeVM

- (void)listWithResponseBlock:(ResponseBlock)responseBlock
{
//    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    NSString *url = @"http://v.juhe.cn/movie/index?title=%25e9%2580%259f%25e5%25ba%25a6&smode=0&pagesize=&offset=&dtype=&key=0d1194bc100bfc68d6843413fe28e51a";
    
    [HFNetworking requestWithBaseUrl:url type:HttpRequestTypeGet responseBlock:^(BOOL isOK, id data, NSError *error) {
        
        NSArray *arr = data;
    }];
}



 


@end
