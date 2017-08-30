//
//  UITextField+CategoryKit.h
//  CategoryKit
//
//  Created by smallsevenk on 14/5/12.
//  Copyright (c) 2015 HappinessFamily. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UITextField`.
 */
@interface UITextField (CategoryKit)

/**
 Set all text selected.
 */
- (void)selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)setSelectedRange:(NSRange)range;

///金额输入限制
- (BOOL)isValidMoneyWithMaxLength:(NSUInteger)maxLength
                            range:(NSRange)range
                replacementString:(NSString *)string;
///placeholder颜色
- (void)setPlaceholderColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
