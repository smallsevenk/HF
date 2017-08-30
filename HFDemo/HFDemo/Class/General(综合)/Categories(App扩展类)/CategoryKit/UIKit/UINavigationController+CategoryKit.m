//
//  UINavigationController+CategoryKit.m
//  HFDemo
//
//  Created by smallsevenk on 2017/6/5.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "UINavigationController+CategoryKit.h"

@implementation UINavigationController (CategoryKit)

///前一个ViewController
- (nullable __kindof UIViewController *)previousViewController
{
    if (self.viewControllers.count > 0) {
        return self.viewControllers[self.viewControllers.count-2];
    }
    return nil;
}

///所有包含cls的数组
- (NSArray<__kindof UIViewController *> *)viewControllersOfClass:(Class)cls
{
    if (!cls) {
        return nil;
    }
    NSMutableArray *array = [NSMutableArray new];    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:cls]) {
            [array addObject:obj];
        }
    }];
    
    return array;
}

- (void)popToViewControllerAtIndex:(NSUInteger)index
{
    if (index >= self.viewControllers.count) {
        return;
    }
    
    [self popToViewController:self.viewControllers[index] animated:YES];
}

- (void)pushRootViewControllerAndViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *vcList = self.navigationController.viewControllers;
    if (vcList.count > 0 && viewController) {
        [self.navigationController setViewControllers:@[vcList.firstObject,viewController] animated:animated];
    }
}

@end
