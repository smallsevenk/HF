//
//  UIActionSheet+CategoryKit.h
//  CategoryKit
//
//  Created by xujun on 15/7/15.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionSheetCompleteBlock) (NSInteger buttonIndex);

@interface UIActionSheet (CategoryKit) <UIActionSheetDelegate>

- (void)showInView:(UIView *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler;

- (void)showFromToolbar:(UIToolbar *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler;

- (void)showFromTabBar:(UITabBar *)view withCompletionHandler:(ActionSheetCompleteBlock)completionHandler;
- (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
withCompletionHandler:(ActionSheetCompleteBlock)completionHandler;

- (void)showFromBarButtonItem:(UIBarButtonItem *)item
                     animated:(BOOL)animated
        withCompletionHandler:(ActionSheetCompleteBlock)completionHandler;
@end


NS_ASSUME_NONNULL_END