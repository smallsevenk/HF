//
//  ChangeServerViewController.h
//  HFDemo
//
//  Created by smallsevenk on 16/12/24.
//  Copyright © 2016年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ServerModel.h"

@interface ChangeServerVC : BaseViewController

+ (ServerModel*)basicSever;

+ (void)changeBasicSever:(ServerModel*)model;

@end
