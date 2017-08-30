//
//  CLLocationManager+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 16/7/6.
//  Copyright © 2016年 HappinessFamily. All rights reserved.
//

#import "CLLocationManager+CategoryKit.h"

@implementation CLLocationManager (CategoryKit)

+ (BOOL)isOpenUserDeviceLocation
{
    if (![CLLocationManager locationServicesEnabled]) {
        return NO;
    }
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        return NO;
    } else {
        return YES;
    }
}
@end
