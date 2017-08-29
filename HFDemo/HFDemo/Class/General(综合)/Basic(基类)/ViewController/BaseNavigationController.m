//
//  BaseNavigationController.m
//  BaseUIKit
//
//  Created by xujun on 15/8/24.
//  Copyright (c) 2015年 xujun. All rights reserved.


#import "BaseNavigationController.h"
#import "UIColor+Additions.h"

#import "FLEXManager.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@property (nonatomic,assign) NSTimeInterval lastestPushViewControllerTime;
@end

@implementation BaseNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    rootViewController.hidesBottomBarWhenPushed = NO;
    return [super initWithRootViewController:rootViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationBar.translucent = NO;
    
    
    [self.navigationBar setBarTintColor:[UIColor navigationBarColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],
                                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];
    
    //    [self setEnadleBackGes:YES];
    
    /* UINavigationControllerDelegate */
    self.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof (self) weakSelf = self;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
    
    //去除导航栏下方的横线 
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    
    
#ifdef DEBUG
    [self setEnabledFLEXManager];
#endif
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!viewController){
        NSLog(@"viewController is nil ,Application tried to push a nil view controller on target <BaseNavigationController: >.");
        return;
    }
    //两次push 之间间隔必须大于0.2秒
    NSTimeInterval currentTime = [NSDate date].timeIntervalSince1970;
    if (ABS(currentTime - _lastestPushViewControllerTime) < 0.2) {
        _lastestPushViewControllerTime = currentTime;
        return;
    }
    _lastestPushViewControllerTime = currentTime;

    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    
    [super pushViewController:viewController animated:animated];
}

- (NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!viewController) {
        return nil;
    }
    return [super popToViewController:viewController animated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskPortrait;
//}

- (BOOL)shouldAutorotate{
    return NO;
}


#pragma mark - FLEXManager
- (void)setEnabledFLEXManager
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGestureRecognizerAction)];
    tap.numberOfTapsRequired = 2;
    tap.delegate = (id)self;
    [self.navigationBar addGestureRecognizer:tap];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

- (void)doubleTapGestureRecognizerAction
{
    [[FLEXManager sharedManager] showExplorer];
}

@end
