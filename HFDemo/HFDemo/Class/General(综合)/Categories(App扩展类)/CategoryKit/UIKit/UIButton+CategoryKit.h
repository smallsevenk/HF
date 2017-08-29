//
//  UIButton+CategoryKit.h
//  CategoryKit
//
//  Created by xujun on 15/7/29.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CategoryKit)

///添加事件
- (void)addTouchUpInsideTarget:(id)target action:(SEL)action;
///添加对象
@property (nonatomic, retain) id carryObjects;


@end



NS_ASSUME_NONNULL_END
