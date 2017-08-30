//
//  NSString+Additions.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/11.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "NSString+Additions.h"
#import <CommonCrypto/CommonDigest.h> 

@implementation NSString (Additions)



- (NSString*)kToFinancialTypeByStyle:(NSNumberFormatterStyle)style{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    formatter.numberStyle =NSNumberFormatterDecimalStyle;
    
    NSNumber *number = [NSNumber numberWithDouble:[self doubleValue]];
    
    return [formatter stringFromNumber:number];
}

- (NSString*)kToFinancialType{
    return [self kToFinancialTypeByStyle:NSNumberFormatterDecimalStyle];
}

//只返回正数
- (NSString*)kKeepTwoDecimal{
    double value = [self doubleValue];
    if(value < 0){
        value = 0;
    }
    return [NSString stringWithFormat:@"%.02f",value];
}

//把千分分隔数字去掉，
- (NSString *)removeCommaForMicrometerString
{
    NSMutableString *str1 = [NSMutableString stringWithString:self];
    for (int i = 0; i < str1.length; i++) {
        unichar c = [str1 characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        if (c == ',') { //此处可以是任何字符
            [str1 deleteCharactersInRange:range];
            --i;
        }
    }
    NSString *newstr = [NSString stringWithString:str1];
    return newstr;
}

- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }
    
    return count;
}

+(NSString *)arabicNumeralsToChinese:(int)number
{
    if (!number) {
        return @"";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInt:number]];
    return string;
    //    原值:2.7999999999
    //    kCFNumberFormatterRoundCeiling = 0,//四舍五入,直接输出3
    //    kCFNumberFormatterRoundFloor = 1,//保留小数输出2.8
    //    kCFNumberFormatterRoundDown = 2,//加上了人民币标志,原值输出￥2.8
    //    kCFNumberFormatterRoundUp = 3,//本身数值乘以100后用百分号表示,输出280%
    //    kCFNumberFormatterRoundHalfEven = 4,//输出2.799999999E0
    //    kCFNumberFormatterRoundHalfDown = 5,//原值的中文表示,输出二点七九九九。。。。
    //    kCFNumberFormatterRoundHalfUp = 6//原值中文表示,输出第三
}

- (NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}

- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

- (NSString*)safeSubStringTo:(NSInteger)index
{
    if (self.length>=index) {
        return [self substringToIndex:index];
    }
    return @"";
}

- (NSString*)safeSubStringFrom:(NSInteger)index
{
    if (self.length>=index) {
        return [self substringFromIndex:index];
    }
    return @"";
}

- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

- (NSString *)getAmongStringFrom:(NSString*)begin to:(NSString*)end{
    
    NSRange beginRange = [self rangeOfString:begin];
    NSRange endRange = [self rangeOfString:end];
    
    NSInteger beginIndex = beginRange.location + beginRange.length;
    NSInteger endIndex = endRange.location;
    
    if (beginIndex >= endIndex){
        return @"";
    }else{
        return [self getSubstringFrom:beginIndex to:endIndex];
    }
}

- (NSInteger)subStringLocation:(NSString*)subStr{
    NSRange subRange = [self rangeOfString:subStr];
    return subRange.location;
}

- (NSMutableArray *)getRepeatCharRangeBySearchChar:(NSString *)searchChar
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:20];
    if (searchChar == nil && [searchChar isEqualToString:@""]) {
        return nil;
    }
    NSRange rang = [self rangeOfString:searchChar];
    if (rang.location != NSNotFound && rang.length != 0) {
        [arrayRanges addObject:NSStringFromRange(rang)];
        NSRange rang1 = {0,0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++)
        {
            if (0 == i) {
                location = rang.location + rang.length;
                length = self.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            }else
            {
                location = rang1.location + rang1.length;
                length = self.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            rang1 = [self rangeOfString:searchChar options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0) {
                break;
            }else
                [arrayRanges addObject:NSStringFromRange(rang1)];
        }
        return arrayRanges;
    }
    return nil;
}

+ (NSString *)getStringFromArray:(NSArray *)array withJoinedString:(NSString *)joinedString
{
    return [array componentsJoinedByString:joinedString];
}



+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+(NSString*) getBundleID

{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
}


+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}

- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}

- (NSDate*)toDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:self];
    return date;
}

- (NSDate*)toDateByFormater:(NSString*)fm{
    if (fm && fm.length > 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: fm];
        NSDate *date = [formatter dateFromString:self];
        return date;
    }
    else{
        return [self toDate];
    }
}

- (NSString*)revertYFLTime{
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [_formatter dateFromString:self];
    NSString *_date=[_formatter stringFromDate:date];
    return _date;
}

- (NSString*)revertULinxTime{
    double unixTimeStamp = [((NSString*)self) doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *_date=[_formatter stringFromDate:date];
    return _date;
}

- (NSString*)revertRYTVULinxTime{
    double unixTimeStamp = [((NSString*)self) doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    if ([date isToday]) {
        [_formatter setDateFormat:@"HH:mm"];
    }
    NSString *_date=[_formatter stringFromDate:date];
    return _date;
}

- (NSString*)revertULinxTimeWith:(NSString*)separated{
    double unixTimeStamp = [((NSString*)self) doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:[NSString stringWithFormat:@"yyyy%@MM%@dd",separated,separated]];
    NSString *_date=[_formatter stringFromDate:date];
    return _date;
}

+ (NSString*) uniqueString
{
    CFUUIDRef	uuidObj = CFUUIDCreate(nil);
    NSString	*uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}

- (NSString*) urlEncodedString {
    
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (__bridge CFStringRef) self,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) encodedCFString];
    
    if(!encodedString)
        encodedString = @"";
    
    return encodedString;
}

- (NSString*) urlDecodedString {
    
    CFStringRef decodedCFString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef) self,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    
    // We need to replace "+" with " " because the CF method above doesn't do it
    NSString *decodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) decodedCFString];
    return (!decodedString) ? @"" : [decodedString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}


-(NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(NSString *)sha1{
    
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

-(BOOL)isBlank
{
    BOOL isBank = ![self isValid];
    return isBank;
}

-(BOOL)isValid
{
    NSString *source = [self removeWhiteSpacesFromString];
    if (source.length>0) {
        return true;
    }
    return ([source isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

- (BOOL)isValidIdCard{
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [identityCardPredicate evaluateWithObject:self];
}

- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

-(BOOL)isInFuture{
    if (self.length >0 ) {
        NSDateFormatter * df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate *date = [df dateFromString:self];
        if ([date isInFuture]) {
            return YES;
        }
    }
    return NO;
}


//有效的护照
-(BOOL)isValidPassport
{
    NSString *regex1 = @"/^[a-zA-Z]{5,17}$/";
    NSString *regex2 = @"/^[a-zA-Z0-9]{5,17}$/";
    
    NSPredicate *passPortTestPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    NSPredicate *passPortTestPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    
    return [passPortTestPredicate1 evaluateWithObject:self] || [passPortTestPredicate2 evaluateWithObject:self];
}

//港澳通行证
-(BOOL)isValidHKAMPassPort
{
    NSString *regex = @"([A-Z]\\d{8})";
    NSPredicate *HKAMPassPortPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [HKAMPassPortPredicate evaluateWithObject:self];
}

//台胞证
-(BOOL)isValidTaiWanPassPort
{
    NSString *regex1 = @"/^[0-9]{8}$/";
    NSString *regex2 = @"/^[0-9]{10}$/";
    
    NSPredicate *TaiWanPassPortPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    NSPredicate *TaiWanPassPortPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    
    return [TaiWanPassPortPredicate1 evaluateWithObject:self] || [TaiWanPassPortPredicate2 evaluateWithObject:self];
}


- (BOOL)isVAlidPhoneNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,176
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        if([regextestcm evaluateWithObject:self] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:self] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:self] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
        
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isVAlidQQNumber
{
    NSString *regex = @"^\\d{5,12}$";
    NSPredicate *telNumPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [telNumPre evaluateWithObject:self];
}

- (BOOL)isValidUrl
{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

- (BOOL)isPasswordWithMinCharLength:(int)minCL maxCharLength:(int)maxCL{
    NSString * regex = [NSString stringWithFormat:@"^[A-Za-z0-9]{%d,%d}$",minCL,maxCL];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isValidUserName{
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    
    
    if(![pred evaluateWithObject:self])
    {
        return NO;
    }
    return YES;
}

-(BOOL)isValidBankCard
{
    if(self == nil || self.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++){
        c = [self characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}


- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

- (BOOL)isBeginWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

- (BOOL)isEndWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}



- (NSDictionary *)jsonStringToDictionary{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (NSString *)subStringMaxLength:(NSInteger)len
{
    NSString *returnStr = self;
    if (self.length > len)
    {
        returnStr = [[self substringToIndex:len] appendWithString:@"..."];
    }
    
    return returnStr;
}



#pragma mark 货币计算
+ (NSString *)decimalNumberCalucate:(NSString *)originValue1 originValue2:(NSString *)originValue2 calucateWay:(kCalucateWay)calucateWay
{
    NSDecimalNumber *decimalNumber1 = [NSDecimalNumber decimalNumberWithString:originValue1];
    NSDecimalNumber *decimalNumber2 = [NSDecimalNumber decimalNumberWithString:originValue2];
    
    NSDecimalNumber *product;
    
    switch (calucateWay)
    {
        case kCalucateWayAdding:
        {
            product = [decimalNumber1 decimalNumberByAdding:decimalNumber2];
            break;
        }
            
        case kCalucateWaySubtracting:
        {
            product = [decimalNumber1 decimalNumberBySubtracting:decimalNumber2];
            break;
        }
            
        case kCalucateWayMultiplying:
        {
            product = [decimalNumber1 decimalNumberByMultiplyingBy:decimalNumber2];
            break;
        }
            
        case kCalucateWayDividing:
        {
            product = [decimalNumber1 decimalNumberByDividingBy:decimalNumber2];
            break;
        }
            
        default:
            break;
    }
    
    return [product stringValue];
}


+ (NSString *)decimalNumberCalucate:(NSArray*)addValues calucateWay:(kCalucateWay)calucateWay
{
    NSDecimalNumber *product;
    
    for (NSString *number in addValues)
    {
        NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithString:number];
        
        if (!product)
        {
            product = decimalNumber;
            continue;
        }
        
        switch (calucateWay)
        {
            case kCalucateWayAdding:
            {
                product = [product decimalNumberByAdding:decimalNumber];
                break;
            }
                
                
            case kCalucateWaySubtracting:
            {
                product = [product decimalNumberBySubtracting:decimalNumber];
                break;
            }
                
            case kCalucateWayMultiplying:
            {
                product = [product decimalNumberByMultiplyingBy:decimalNumber];
                break;
            }
                
            case kCalucateWayDividing:
            {
                product = [product decimalNumberByDividingBy:decimalNumber];
                break;
            }
                
            default:
                break;
        }
        
    }
    
    return [product stringValue];
}

@end
