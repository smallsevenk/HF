//
//  UITextField+CategoryKit.m
//  CategoryKit
//
//  Created by smallsevenk on 14/5/12.
//  Copyright (c) 2015 HappinessFamily. All rights reserved.
//
#import "UITextField+CategoryKit.h"
#import "NSString+Valid.h"

@implementation UITextField (CategoryKit)

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


- (BOOL)isValidMoneyWithMaxLength:(NSUInteger)maxLength
                            range:(NSRange)range
                replacementString:(NSString *)string
{
    UITextField *textField = self;
    NSString *toString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (toString.length == 0 || string.length == 0) {
        return YES;
    }
    
    if([toString isEqualToString:@"0.00"]){
        return NO;
    }
    
    if ([toString isEqualToString:@"."] || [toString isEqualToString:@"0"]) {
        textField.text = @"0.";
        return NO;
    }
    
    BOOL isExistDot = NO;
    NSUInteger dotLocation = 0;
    for (NSInteger index = 0; index < toString.length; ++index) {
        unichar ch = [toString characterAtIndex:index];
        if (ch >='0' && ch<='9') {//数据格式正确
            //do nothing
        }
        else if (ch == '.') {
            //不允许 两个小数点
            if (isExistDot) {
                return NO;
            }
            
            isExistDot = YES;
            dotLocation = index;
        }
        else {
            //非法字符
            return NO;
        }
    }
    
    ///长度判断
    if (![textField.text isValidMaxLength:maxLength withRange:range replacementString:string]) {
        return NO;
    }
    
    ///02222这类情况
    if (toString.length >= 2 && [toString characterAtIndex:0] == '0' && [toString characterAtIndex:1] != '.') {
        textField.text = @(toString.doubleValue).stringValue;
        return NO;
    }
    
    //不存在小数点
    if (!isExistDot) {
        return YES;
    }
    
    //小数点后面长度
    NSUInteger dotAfterLength = toString.length - dotLocation -1;
    if (dotAfterLength > 2) {
        return NO;
    }
    
    return YES;
}


- (void)setPlaceholderColor:(UIColor*)color{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}


@end
