//
//  UITableViewCell+CategoryKit.m
//  HFDemo
//
//  Created by smallsevenk on 2017/6/1.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "UITableViewCell+CategoryKit.h"

@implementation UITableViewCell (CategoryKit)

+ (NSString *)identifier
{
    return NSStringFromClass(self.class);
}

+ (CGFloat)height
{
    return 44;
}


+ (id)cellNibWithTableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self identifier]];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:[self identifier] owner:self options:nil] lastObject];
    }
    return cell;
}

+ (id)cellClassWithTableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self identifier]];
    if (cell == nil) {
        cell = [[self.class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self identifier]];
    }
    return cell;
}


@end
