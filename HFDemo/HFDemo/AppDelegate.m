//
//  AppDelegate.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/29.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//


#import "AppDelegate.h"
#import "HomeVC.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [self setRootVC];
}

- (BOOL)setRootVC{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:[[HomeVC alloc] init]];
    self.window.rootViewController = nav;
    
    //    [self initializeApp];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)initializeApp
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //颜色
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
