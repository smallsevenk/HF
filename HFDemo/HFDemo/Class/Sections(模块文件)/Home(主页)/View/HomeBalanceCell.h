//
//  HomeBalanceCell.h
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/17.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoSubView.h"

@interface HomeBalanceCell : UITableViewCell

@property (nonatomic, strong)   TwoSubView *leftBgView;
@property (nonatomic, strong)   TwoSubView *rightBgView;

@end
