//
//  HomeVM.h
//  HFDemo
//
//  Created by smallsevenk on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResponseBlock)(BOOL isOK, id data, NSError *error);

@interface HomeVM : NSObject

- (void)listWithResponseBlock:(ResponseBlock)responseBlock;


@end
