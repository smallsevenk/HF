//
//  UINavigationController+CategoryKit.h
//  HFDemo
//
//  Created by smallsevenk on 2017/6/5.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (CategoryKit)
///前一个ViewController
- (nullable __kindof UIViewController *)previousViewController;

///所有包含cls的数组
- (nullable NSArray<__kindof UIViewController *> *)viewControllersOfClass:(nullable Class)cls;

///退回到index
- (void)popToViewControllerAtIndex:(NSUInteger)index;

///push 到 rootviewController 和viewController
- (void)pushRootViewControllerAndViewController:(nullable __kindof UIViewController *)viewController animated:(BOOL)animated;

@end


NS_ASSUME_NONNULL_END
