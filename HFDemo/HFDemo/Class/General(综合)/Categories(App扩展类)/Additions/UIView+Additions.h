//
//  UIView+Additions.h
//  Enfry
//
//  Created by xujun on 2017/5/18.
//  Copyright © 2017年 enfry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)
///兼容老代码
//移除所有子视图
- (void)kRemoveAllSubViews;

- (void)setLayerMasksToBoundsAndCornerRadius:(CGFloat)radius;
- (void)setLayerBorderWidth:(CGFloat)width borderColor:(UIColor*)color;
- (void)setLayerMasksToBoundsAndCornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)color;
- (void)setLayerCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)setLayerCorners:(UIRectCorner)corners radius:(CGFloat)radius size:(CGSize)size;


#pragma mark - Line

//加线条
- (id)addLine:(CGRect)rect color:(UIColor*)color;

//获取视图
- (UIView *)viewRect:(CGRect)rect bgColor:(UIColor*)color;


#pragma mark - 居中设置

//Center.x同父视图
- (void)setCenterXEqualSuper;

//Center.y同父视图
- (void)setCenterYEqualSuper;

//Center同父视图
- (void)setCenterEqualSuper;

@end
