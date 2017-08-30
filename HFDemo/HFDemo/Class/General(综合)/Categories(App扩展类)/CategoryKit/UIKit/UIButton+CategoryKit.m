//
//  UIButton+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 15/7/29.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import "UIButton+CategoryKit.h"
#import "NSString+CategoryKit.h"
#import <objc/runtime.h>


static char BUTTONCARRYOBJECTS;
@implementation UIButton (CategoryKit)


///添加事件
- (void)addTouchUpInsideTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}



- (void)setCarryObjects:(id)carryObjects{
    objc_setAssociatedObject(self, &BUTTONCARRYOBJECTS, carryObjects, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)carryObjects{
    return objc_getAssociatedObject(self, &BUTTONCARRYOBJECTS);
}




@end
