//
//  NSAttributedString+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 15/8/4.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import "NSAttributedString+CategoryKit.h"


@implementation NSAttributedString (CategoryKit)


+ (NSAttributedString *)attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font range:(NSRange)range{
    if (string.length == 0) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    if (font) {
        [attributedString addAttribute:NSFontAttributeName value:font range:range];
    }
    
    return attributedString;
}


///行间距
+ (NSAttributedString *)attributedLineSpacingStringWithString:(NSString *)string
                                                        color:(UIColor *)color
                                                         font:(UIFont *)font
                                                  lineSpacing:(CGFloat)lineSpacing
{
    if (string.length == 0) {
        return nil;
    }
    
    NSRange range = NSMakeRange(0, string.length);
    
    NSMutableAttributedString *attributedString = (NSMutableAttributedString *)[NSAttributedString attributedStringWithString:string color:color font:font range:range];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return attributedString;
}

@end

@implementation NSMutableAttributedString (CategoryKit)



@end


