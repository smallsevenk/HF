//
//  NSAttributedString+CategoryKit.h
//  CategoryKit
//
//  Created by xujun on 15/8/4.
//  Copyright (c) 2014 xujun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSAttributedString (CategoryKit)

///设置一段不同颜色的字体颜色
+ (NSAttributedString *)attributedStringWithString:(nullable NSString *)string
                                             color:(nullable UIColor *)color
                                              font:(nullable UIFont *)font
                                             range:(NSRange)range;
///行间距
+ (NSAttributedString *)attributedLineSpacingStringWithString:(nullable NSString *)string
                                                        color:(nullable UIColor *)color
                                                         font:(nullable UIFont *)font
                                                  lineSpacing:(CGFloat)lineSpacing;


@end



@interface NSMutableAttributedString (CategoryKit)

@end

NS_ASSUME_NONNULL_END
