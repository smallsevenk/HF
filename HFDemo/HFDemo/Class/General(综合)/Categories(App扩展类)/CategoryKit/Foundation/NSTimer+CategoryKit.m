//
//  NSTimer+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 14/15/11.
//  Copyright (c) 2015 HappinessFamily. All rights reserved.
//
#import "NSTimer+CategoryKit.h"

@implementation NSTimer (CategoryKit)

+ (void)_x_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_x_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_x_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

@end
