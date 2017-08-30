//
//  NSString+CategoryKit.m
//
//
//  Created by smallsevenk on 5/3/14.
//  Copyright (c) 2014 HappinessFamily. All rights reserved.
//


#import "NSString+CategoryKit.h"
#import "NSData+CategoryKit.h"
//#import "UIDevice+CategoryKit.h"
#import "NSNumber+CategoryKit.h"


@implementation NSString (CategoryKit)

+ (instancetype)stringWithNilFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
{
    if (format.length == 0)
        return format;
    
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    //return str;
    return [str stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
}


- (NSString *)stringByAddingNetworkPercentEncoding
{
    NSString *encode = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);

    return encode;
}



+ (NSNumber *)numberWithMoney:(id)money
{
    if ([money isKindOfClass:[NSNumber class]]) {
        return money;
    }
    
    if ([money isKindOfClass:[NSString class]]) {
        return [NSNumber numberWithDouble:[(NSString *)money doubleValue]];
    }
    
    return nil;
}


///带货币符号￥(eg.  ￥3,333,333.00)
+ (NSString *)currencySymbolStringWithMoney:(id)money
{
    return [NSString currencySymbolStringWithSymbol:@"￥" number:[NSString numberWithMoney:money]];
}

///不带货币符号(eg. 33,333,33.00)
+ (NSString *)currencyNoSymbolStringWithMoney:(id)money
{
    return [NSString currencySymbolStringWithSymbol:@"" number:[NSString numberWithMoney:money]];
}

+ (NSString *)currencySymbolStringWithSymbol:(NSString *)symbol number:(NSNumber *)number
{
    if (number == nil) {
        return [NSString stringWithFormat:@"%@0.00",symbol?:@""];
    }
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    numberFormatter.currencySymbol = symbol;
    NSString *numberString = [numberFormatter stringFromNumber:number];
    return numberString;
}



- (BOOL)isPureInt
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    BOOL b = [scan scanInt:&val] && [scan isAtEnd];
    
    return b;
}

//银行
- (NSString *)bankCardNumberHidePrivateInfo
{
    if ([self stringByReplacingOccurrencesOfString:@" " withString:@""].length <= 8) {
        return self;
    }
    NSMutableString *str = [NSMutableString stringWithString:self];
    [str deleteCharactersInRange:NSMakeRange(4, self.length - 4)];

    for (int i = 4; i < self.length - 4; i++) {
        NSString *subString = [self substringWithRange:NSMakeRange(i, 1)];
        NSString *subString1 = [self substringWithRange:NSMakeRange(i + 1, self.length - i - 1)];
        if ([subString isPureInt]) {
            [str insertString:@"*" atIndex:i];
        }else{
            [str insertString:subString atIndex:i];
        }
        if ([subString1 stringByReplacingOccurrencesOfString:@" " withString:@""].length == 4) {
            [str appendString:subString1];
            break;
        }
    }
    return str;
}



- (NSString *)numberFormatter:(NSString *)num{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    //    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    [nf setPositiveFormat:@"###,##0.00;"];
    return [nf stringFromNumber:[NSNumber numberWithDouble:[num doubleValue]]];
}




- (NSString *)stringByRemoveNewLineEndChar
{
    NSString *text = self;
    for (NSUInteger index = 0; index < text.length; ++index) {
        NSString *subText = [text substringFromIndex:text.length - 1];
        
        if ([subText isEqualToString:@"\r"] || [subText isEqualToString:@"\n"]) {
            text = [text stringByReplacingCharactersInRange:NSMakeRange(text.length-1, 1) withString:@""];
        }
        else {
            break;
        }
    }
    return text;
}



- (NSString *)appendWithString:(nullable NSString *)aString
{
    if (aString.length == 0) return self;
    return [self stringByAppendingString:aString];
}



+ (NSString *)meterStringWithCGFloatMeter:(CGFloat)meter
{
    NSUInteger value = meter;
    
    if (value < 1000) {
        
        if (value > 10) {
            value -= value%10;
        }
        return [NSString stringWithFormat:@"%lu米",(unsigned long)value];
    }
    else {
        value = value/1000;
        
        if (value > 10) {
            value -= value%10;
        }
        
        
        return [NSString stringWithFormat:@"%lu公里",(unsigned long)value];
    }
    
}


+ (NSString *)spaceSizeWithByte:(NSUInteger)byte divisor:(NSInteger)divisor
{
    NSString *unit = @"B";
    if (byte == 0 || divisor == 0 || byte < divisor) {
        return [NSString stringWithFormat:@"%ld %@",byte,unit];
    }
    
    NSUInteger count = 0;
    NSUInteger tmpByte = byte;
    while (tmpByte/divisor >= 1) {
        ++count;
        tmpByte = tmpByte/divisor;
    }
    
    
    if (count == 1) {
        unit = @"K";
    }
    else if (count == 2) {
        unit = @"M";
    }
    else if (count == 3) {
        unit = @"G";
    }
    else if (count == 4) {
        unit = @"T";
    }
    else if (count == 5) {
        unit = @"P";
    }
    else if (count == 6) {
        unit = @"E";
    }
    else if (count == 7) {
        unit = @"Z";
    }
    else if (count == 8) {
        unit = @"Y";
    }
    
    CGFloat value = (CGFloat)byte;
    while (count--) {
        value = value/divisor;
    }
    
    return [NSString stringWithFormat:@"%.2f%@",value,unit];
}

- (NSString *)stringByReplaceWrapToSpace
{
    NSString *str = [self stringByReplacingOccurrencesOfString:@"\r" withString:@" "];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    return str;
}


- (NSString *)mobileServiceName
{
    NSString *string = self;
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:string] == YES) || ([regextestcm evaluateWithObject:string] == YES) || ([regextestct evaluateWithObject:string] == YES) || ([regextestcu evaluateWithObject:string] == YES)){
        if([regextestcm evaluateWithObject:string] == YES)
            return @"China Mobile";
        else if([regextestct evaluateWithObject:string] == YES)
            return @"China Telecom";
        else if ([regextestcu evaluateWithObject:string] == YES)
            return @"China Unicom";
        else
            return @"Unknow";
        
    }else
        return @"Unknow";
}


- (NSString *)dateStringFromFormat:(NSString *)fromFormat
                          toFormat:(NSString *)toFormat
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = fromFormat;
    NSDate *date = [dateFormatter dateFromString:self];
    dateFormatter.dateFormat = toFormat;
    
    return [dateFormatter stringFromDate:date];
    
}

///金额 保留两位 四舍五入  position 几位小数
+ (NSString *)roundingFormatWithFloat:(double)price afterPoint:(NSInteger)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler
                                                decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithDouble:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    if(position == 0){
        return [NSString stringWithFormat:@"%.0f",[roundedOunces doubleValue]];
    }
    else if(position == 1){
        return [NSString stringWithFormat:@"%.1f",[roundedOunces doubleValue]];
    }
    else if(position == 2){
        return [NSString stringWithFormat:@"%.2f",[roundedOunces doubleValue]];
    }
    else if(position == 3){
        return [NSString stringWithFormat:@"%.3f",[roundedOunces doubleValue]];
    }
    else if(position == 4){
        return [NSString stringWithFormat:@"%.4f",[roundedOunces doubleValue]];
    }
    else if(position == 5){
        return [NSString stringWithFormat:@"%.5f",[roundedOunces doubleValue]];
    }
    
    
    return [NSString stringWithFormat:@"%.2f",[roundedOunces doubleValue]];
}



#pragma  mark - text

- (CGFloat)heightWithFont:(UIFont *)font forWidth:(CGFloat)width
{
    return [self sizeWithFont:font forWidth:width lineBreakMode:NSLineBreakByWordWrapping].height;
    
}

- (CGFloat)widthWithFont:(UIFont *)font
{
    return [self sizeWithFont:font forWidth:CGFLOAT_MAX lineBreakMode:NSLineBreakByWordWrapping].width;
}


- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font forWidth:CGFLOAT_MAX lineBreakMode:NSLineBreakByWordWrapping];
}

//NSLineBreakByWordWrapping
- (CGSize)sizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize retSize;
    CGSize maxSize = CGSizeMake(width, CGFLOAT_MAX);
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.alignment = NSTextAlignmentLeft;
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    font,NSFontAttributeName,
                                    paragraphStyle,NSParagraphStyleAttributeName, nil];
        CGRect rect = [self boundingRectWithSize:maxSize
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:attributes
                                         context:nil];
        retSize = rect.size;
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        retSize = [self sizeWithFont:font constrainedToSize:maxSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    
    return retSize;
}

            
            

- (NSString *)md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md2String];
}

- (NSString *)md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md4String];
}

- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

- (NSString *)md5String_16
{
    NSString *string32 = [self md5String];
    NSString *string16 = [string32 substringWithRange:NSMakeRange(8, 16)];
    return string16;
}

- (NSString *)sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1String];
}

- (NSString *)sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha224String];
}

- (NSString *)sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha256String];
}

- (NSString *)sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha384String];
}

- (NSString *)sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha512String];
}

- (NSString *)crc32String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] crc32String];
}

- (NSString *)hmacMD5StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacMD5StringWithKey:key];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA1StringWithKey:key];
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA224StringWithKey:key];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA256StringWithKey:key];
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA384StringWithKey:key];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA512StringWithKey:key];
}

- (NSString *)base64EncodedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
}

+ (NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData *data = [NSData dataWithBase64EncodedString:base64EncodedString];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)stringByURLEncode {
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
         - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
         - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
         - parameter string: The string to be percent-escaped.
         - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length) {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        return escaped;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        return encoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)stringByURLDecode {
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)stringByEscapingHTML {
    NSUInteger len = self.length;
    if (!len) return self;
    
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [self getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableString *result = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        unichar c = buf[i];
        NSString *esc = nil;
        switch (c) {
            case 34: esc = @"&quot;"; break;
            case 38: esc = @"&amp;"; break;
            case 39: esc = @"&apos;"; break;
            case 60: esc = @"&lt;"; break;
            case 62: esc = @"&gt;"; break;
            default: break;
        }
        if (esc) {
            [result appendString:esc];
        } else {
            CFStringAppendCharacters((CFMutableStringRef)result, &c, 1);
        }
    }
    free(buf);
    return result;
}

- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0);
}

- (void)enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block {
    if (regex.length == 0 || !block) return;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!regex) return;
    [pattern enumerateMatchesInString:self options:kNilOptions range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        block([self substringWithRange:result.range], result.range, stop);
    }];
}

- (NSString *)stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement; {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!pattern) return self;
    return [pattern stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:replacement];
}

- (char)charValue {
    return self.numberValue.charValue;
}

- (unsigned char) unsignedCharValue {
    return self.numberValue.unsignedCharValue;
}

- (short) shortValue {
    return self.numberValue.shortValue;
}

- (unsigned short) unsignedShortValue {
    return self.numberValue.unsignedShortValue;
}

- (unsigned int) unsignedIntValue {
    return self.numberValue.unsignedIntValue;
}

- (long) longValue {
    return self.numberValue.longValue;
}

- (unsigned long) unsignedLongValue {
    return self.numberValue.unsignedLongValue;
}

- (unsigned long long) unsignedLongLongValue {
    return self.numberValue.unsignedLongLongValue;
}

- (NSUInteger) unsignedIntegerValue {
    return self.numberValue.unsignedIntegerValue;
}


+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

+ (NSString *)stringWithUTF32Char:(UTF32Char)char32 {
    char32 = NSSwapHostIntToLittle(char32);
    return [[NSString alloc] initWithBytes:&char32 length:4 encoding:NSUTF32LittleEndianStringEncoding];
}

+ (NSString *)stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length {
    return [[NSString alloc] initWithBytes:(const void *)char32
                                    length:length * 4
                                  encoding:NSUTF32LittleEndianStringEncoding];
}

- (void)enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block {
    NSString *str = self;
    if (range.location != 0 || range.length != self.length) {
        str = [self substringWithRange:range];
    }
    NSUInteger len = [str lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    UTF32Char *char32 = (UTF32Char *)[str cStringUsingEncoding:NSUTF32LittleEndianStringEncoding];
    if (len == 0 || char32 == NULL) return;
    
    NSUInteger location = 0;
    BOOL stop = NO;
    NSRange subRange;
    UTF32Char oneChar;
    
    for (NSUInteger i = 0; i < len; i++) {
        oneChar = char32[i];
        subRange = NSMakeRange(location, oneChar > 0xFFFF ? 2 : 1);
        block(oneChar, subRange, &stop);
        if (stop) return;
        location += subRange.length;
    }
}

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSString *)stringByAppendingNameScale:(CGFloat)scale {
    if (fabs(scale - 1) <= __FLT_EPSILON__ || self.length == 0 || [self hasSuffix:@"/"]) return self.copy;
    return [self stringByAppendingFormat:@"@%@x", @(scale)];
}

- (NSString *)stringByAppendingPathScale:(CGFloat)scale {
    if (fabs(scale - 1) <= __FLT_EPSILON__ || self.length == 0 || [self hasSuffix:@"/"]) return self.copy;
    NSString *ext = self.pathExtension;
    NSRange extRange = NSMakeRange(self.length - ext.length, 0);
    if (ext.length > 0) extRange.location -= 1;
    NSString *scaleStr = [NSString stringWithFormat:@"@%@x", @(scale)];
    return [self stringByReplacingCharactersInRange:extRange withString:scaleStr];
}

- (CGFloat)pathScale {
    if (self.length == 0 || [self hasSuffix:@"/"]) return 1;
    NSString *name = self.stringByDeletingPathExtension;
    __block CGFloat scale = 1;
    [name enumerateRegexMatches:@"@[0-9]+\\.?[0-9]*x$" options:NSRegularExpressionAnchorsMatchLines usingBlock: ^(NSString *match, NSRange matchRange, BOOL *stop) {
        scale = [match substringWithRange:NSMakeRange(1, match.length - 2)].doubleValue;
    }];
    return scale;
}

- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}

- (NSNumber *)numberValue {
    return [NSNumber numberWithString:self];
}

- (NSData *)dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSRange)rangeOfAll {
    return NSMakeRange(0, self.length);
}

- (id)jsonValueDecoded {
    return [[self dataValue] jsonValueDecoded];
}

+ (NSString *)stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}


@end
