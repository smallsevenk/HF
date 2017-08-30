//
//  HomeCellModel.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeCellModel.h"

@implementation HomeCellModel

+ (instancetype)initWithCellType:(HomeCellType )type rowHeight:(CGFloat)height
{
    HomeCellModel *obj = [HomeCellModel new];
    obj.cellType = type;
    obj.rowHeight = height;
    
    return obj;
}

@end
