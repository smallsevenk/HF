//
//  CLLocationManager+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 16/7/6.
//  Copyright © 2016年 HappinessFamily. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN


@interface CLLocationManager (CategoryKit)

///是否开启定位服务  开启和关闭系统不会重启应用,只能每次调用
+ (BOOL)isOpenUserDeviceLocation;

@end


NS_ASSUME_NONNULL_END
