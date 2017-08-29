//
//  HomePayCell.h
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HomePayCell : UITableViewCell

//0:付款 1:银联卡 2:购云猴卡
@property (nonatomic, strong)   void(^didSelect)(HomePayCell *wcell,NSInteger idx);

+ (NSArray<NSArray *> *)items;

@end
