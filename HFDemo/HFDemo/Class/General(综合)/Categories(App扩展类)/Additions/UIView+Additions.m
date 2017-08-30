//
//  UIView+Additions.m
//  HFDemo
//
//  Created by smallsevenk on 2017/5/18.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)kRemoveAllSubViews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)setLayerMasksToBoundsAndCornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)setLayerBorderWidth:(CGFloat)width borderColor:(UIColor*)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)setLayerMasksToBoundsAndCornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)color
{
    [self setLayerMasksToBoundsAndCornerRadius:radius];
    [self setLayerBorderWidth:width borderColor:color];
}


- (void)setLayerCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
    if (corners)
    {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

- (void)setLayerCorners:(UIRectCorner)corners radius:(CGFloat)radius size:(CGSize)size
{
    if (corners)
    {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
} 

#pragma mark - Line

- (id)addLine:(CGRect)rect color:(UIColor*)color
{
    
    CALayer *lineLay = [CALayer layer];
    
    lineLay.frame = rect;
    
    if (color)
    {
        lineLay.backgroundColor = color.CGColor;
    }
    
    [self.layer addSublayer:lineLay];
    
    return self;
}

- (UIView *)viewRect:(CGRect)rect bgColor:(UIColor*)color
{
    UIView *lineView = [[UIView alloc] initWithFrame:rect];
    lineView.backgroundColor = color;
    return lineView;
}

#pragma mark - Frame

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setheight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (void)setCenterXEqualSuper
{
    self.left = self.superview.width / 2 - self.width / 2;
}

- (void)setCenterYEqualSuper
{
    self.top = self.superview.height / 2 - self.height / 2;
}

- (void)kViewCenterYWithSuperHeight:(CGFloat)superh selfHeight:(CGFloat)selfh
{
    self.top = superh / 2 - selfh / 2;
}

- (void)setCenterEqualSuper
{
    [self setCenterXEqualSuper];
    [self setCenterYEqualSuper];
}

@end
