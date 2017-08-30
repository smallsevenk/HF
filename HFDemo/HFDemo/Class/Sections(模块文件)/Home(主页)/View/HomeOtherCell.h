//
//  HomeOtherCell.h
//  HFDemo
//
//  Created by Zick.Zhao on 2017/8/17.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"

@interface HomeOtherCell : UITableViewCell

//0: 1: 2:
@property (nonatomic, strong)   void(^didSelect)(HomeOtherCell *cell, HomeOtherCellType type);

+ (NSArray<NSArray *> *)items;

@end
