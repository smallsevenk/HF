//
//  UIImage+ImageEffects.h
//  CategoryKit
//
//  Created by smallsevenk on 14-4-9.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(nullable UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(nullable UIImage *)maskImage;

+ (UIImage *)keyWindowImage;

@end


NS_ASSUME_NONNULL_END
