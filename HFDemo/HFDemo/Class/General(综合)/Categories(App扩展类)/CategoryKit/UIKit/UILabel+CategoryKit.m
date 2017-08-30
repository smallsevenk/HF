//
//  UILabel+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 8/30/14.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//

#import "UILabel+CategoryKit.h"
#import "NSString+CategoryKit.h"

#import "NSAttributedString+CategoryKit.h"

@implementation UILabel (CategoryKit)

- (CGFloat)textHeightForWidth:(CGFloat)width NS_AVAILABLE_IOS(6_0)
{
    return [self.text heightWithFont:self.font forWidth:width];
}

- (CGFloat)textHeight NS_AVAILABLE_IOS(6_0)
{
    return [self textHeightForWidth:CGRectGetWidth(self.frame)];
}

- (CGFloat)textWidth NS_AVAILABLE_IOS(6_0)
{
    return [self.text widthWithFont:self.font];
}

///去掉 尾部回车换行
- (void)setRemoveEndNewLineCharText:(NSString *)text
{
    [self setText:[text stringByRemoveNewLineEndChar]];
}


@end
