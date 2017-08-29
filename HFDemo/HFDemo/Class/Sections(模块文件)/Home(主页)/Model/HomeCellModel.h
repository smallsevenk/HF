//
//  HomeCellModel.h
//  BBGWallet
//
//  Created by Zick.Zhao on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HomeCellType) {
    HomeCell_Pay,//支付
    HomeCell_AD,//广告
    HomeCell_Balance,//余额
    HomeCell_Other,//其他入口
};

typedef NS_ENUM(NSInteger,HomeOtherCellType) {
    OtherType_bindCard,//绑卡
    OtherType_cardBag,//卡包
    OtherType_cardDetail,//卡明细
    OtherType_bill,//账单
    OtherType_autonym,//实名认证
    OtherType_securityCenter,//安全中心
};

@interface HomeCellModel : NSObject

@property (nonatomic, assign)   HomeCellType cellType;
@property (nonatomic, assign)   CGFloat rowHeight;


+ (instancetype)initWithCellType:(HomeCellType)type rowHeight:(CGFloat)height;

@end
