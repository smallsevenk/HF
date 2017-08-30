//
//  UINavigationItem+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 15/9/7.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface UINavigationItem (CategoryKit)

///增加左侧导航栏按钮
- (void)addAppLeftBarButtonItem:(UIBarButtonItem *)item;
- (void)setAppLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
- (void)setAppLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)items;
- (void)setAppLeftBarButtonItemsHidden:(BOOL)hidden;//隐藏
- (void)setAppLeftBarButtonItemsHighlighted:(BOOL)highlighted;//高亮

///增加右侧导航栏按钮
- (void)addAppRightBarButtonItem:(UIBarButtonItem *)item;
- (void)setAppRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;
- (void)setAppRightBarButtonItems:(NSArray<UIBarButtonItem *> *)items;
- (void)setAppRightBarButtonItemsHidden:(BOOL)hidden;//隐藏
- (void)setAppRightBarButtonItemsHighlighted:(BOOL)highlighted;//高亮

@end


@interface UIBarButtonItem (NavigationItem)

///创建
+ (instancetype)barButtonItemWithTitle:(nullable NSString *)title
                             imageName:(nullable NSString *)imageName
                    highlightImageName:(nullable NSString *)highlightImageName
                                target:(nullable id)target
                              selector:(nullable SEL)selector;

@end


NS_ASSUME_NONNULL_END
