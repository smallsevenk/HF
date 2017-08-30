//
//  UITableViewCell+CategoryKit.h
//  HFDemo
//
//  Created by smallsevenk on 2017/6/1.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CategoryKit)

+ (id)cellNibWithTableView:(UITableView *)tableView;
+ (id)cellClassWithTableView:(UITableView *)tableView;

///重用唯一标识
+ (NSString *)identifier;
///默认高度
+ (CGFloat)height;

@end
