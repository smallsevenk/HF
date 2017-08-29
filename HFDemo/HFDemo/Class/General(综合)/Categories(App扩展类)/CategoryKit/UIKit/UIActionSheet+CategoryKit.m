//
//  UIActionSheet+CategoryKit.m
//  CategoryKit
//
//  Created by xujun on 15/7/15.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import "UIActionSheet+CategoryKit.h"
#import <objc/runtime.h>
static char key;

@implementation UIActionSheet (CategoryKit)



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ActionSheetCompleteBlock block = objc_getAssociatedObject(self, &key);
    if (block) {
        block(buttonIndex);
    }
}


- (void)showInView:(UIView *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler
{
    if (completionHandler) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, completionHandler, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showInView:view];
}

- (void)showFromToolbar:(UIToolbar *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler
{
    if (completionHandler) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, completionHandler, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showFromToolbar:view];
}

- (void)showFromTabBar:(UITabBar *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler
{
    if (completionHandler) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, completionHandler, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showFromTabBar:view];
}

- (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
withCompletionHandler:(ActionSheetCompleteBlock)completionHandler
{
    if (completionHandler) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, completionHandler, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showFromRect:rect inView:view animated:animated];
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item
                     animated:(BOOL)animated
        withCompletionHandler:(ActionSheetCompleteBlock)completionHandler
{
    if (completionHandler) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, completionHandler, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showFromBarButtonItem:item animated:animated];
}

@end
