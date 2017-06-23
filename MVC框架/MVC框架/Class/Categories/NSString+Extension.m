//
//  NSString+Extension.m
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(Extension)

/**
 *  NSStringmd5加密
 *
 *  @return NSString
 */
-(NSString *)md5
{
    return [NSString md5:self];
}

/**
 *  md5Hash -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5Hash
{
    return [NSString md5Hash:self];
}

/**
 *  过滤非法字符
 *
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
-(NSString *)filter:(NSString *)target
{
    return [NSString filterString:self target:target];
}
/**
 * 判断6-12为数字密码
 */

+ (BOOL)checkEmployeeNumber:(NSString *)number{
    NSString *pattern = @"^[0-9]{6,12}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}

/**
 *  判断邮箱是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)emailIsLegal
{
    return [NSString emailIsLegal:self];
}

/**
 *  判断手机号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)mobileIsLegal
{
    return [NSString mobileIsLegal:self];
}

/**
 *  判断身份证号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)idCardIsLegal
{
    return [NSString idCardIsLegal:self];
}

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
-(BOOL)isPureNumandCharacters:(NSString *)string
{
    return [NSString isPureNumandCharacters:string];
}

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
-(BOOL)isContainChinese:(NSString *)string
{
    return [NSString isContainChinese:string];
}

/**
 *  计算文字所占区域 -- 宽度固定，高度自适应
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    return [NSString getStringSize:font size:CGSizeMake(maxWidth, CGFLOAT_MAX) content:self];
}

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font size:(CGSize)size
{
    return [NSString getStringSize:font size:size content:self];
}

/**
 *  NSStringmd5小写加密 
 *
 *  @return NSString
 */
+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

/**
 *  md5Hash
 *
 *  @return NSString
 */
+(NSString *)md5Hash:(NSString *)md5HashString
{
    return [[md5HashString dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}
/**
 *  NSStringmd5加密大写
 *
 *  @return NSString
 */
+(NSString*)md532BitUpper: (NSString *) inPutText{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[16];
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}

/**
 *  过滤非法字符
 *
 *  @param string 原字符串
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
+(NSString *)filterString:(NSString *)string target:(NSString *)target
{
    NSString *tempString = string;
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:target];
    tempString = [[tempString componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString:@""];
    return tempString;
}

/**
 *  判断邮箱是否合法
 *
 *  @param email 邮箱
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)emailIsLegal:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  判断手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)mobileIsLegal:(NSString *)mobile
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *  判断身份证号是否合法
 *
 *  @param idCard 身份证号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)idCardIsLegal:(NSString *)idCard
{
    if (idCard.length <= 0)
    {
        return NO;
    }
    else
    {
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *idCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [idCardPredicate evaluateWithObject:idCard];
    }
}

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
+(BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
+(BOOL)isContainChinese:(NSString *)string
{
    BOOL isContainChinese = NO;
    for (int i = 0; i<string.length; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *tpString = [string substringWithRange:range];
        const char *cString=[tpString UTF8String];
        if (strlen(cString)==3)
        {
            isContainChinese = YES;
            break;
        }
    }
    return isContainChinese;
}

/**
 *  计算文字所占区域
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *  @param content  文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth content:(NSString *)content
{
    return [NSString getStringSize:font size:CGSizeMake(maxWidth, CGFLOAT_MAX) content:content];
}

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *  @param content 文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font size:(CGSize)size content:(NSString *)content
{
    if (content == nil || content.length == 0)
    {
        CGSize size = CGSizeMake(0, 0);
        return size;
    }
    else
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:font forKey:NSFontAttributeName];
        CGRect rect = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return rect.size;
    }
}

#pragma mark - 字符串模块
+ (float)getStringWidth:(NSString *)string AndFont:(float)font {
    
    float Ypos;
    CGSize size = CGSizeMake(SCREEN_WIDTH,MAXFLOAT);
    CGRect rect;
    
    rect=[string boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                              context:nil];
    Ypos=rect.size.width;
    return Ypos;
}

+ (NSAttributedString *)getFormatStringWithSourceString:(NSString *)source KeyWordsOne:(NSString *)keyWordsOne Font:(UIFont *)font Color:(UIColor *)color {
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:source];
    NSRange rangOne = [source rangeOfString:keyWordsOne];
    [attrString addAttribute:NSFontAttributeName value:font range:rangOne];
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:rangOne];
    return attrString;
}

+ (NSString *)nullString:(NSString *)string {
    if (string == nil) {
        string = @"";
    }
    return string;
}
//空值处理
+ (NSString*)convertNull:(NSString *)object{
    
    // 转换空串
    
    if ([object isEqual:[NSNull null]]) {
        return @"";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else if (object == nil){
        return @"";
    } else if ([object isEqualToString:@"<null>"]){
        return @"";
        
    }
    else{
        return object;
    }
    
    
}



//空值处理
+ (BOOL)strIsNull:(NSString *)object{
    
    // 转换空串
    
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object == nil){
        
        return NO;
        
    } else if ([object isEqualToString:@"<null>"]){
        
        return NO;
        
    }
    else{
        return YES;
    }
    
    
}



/**
 * 转化成json字符串
 */

+ (NSString *)getJsonStringWithObj:(id)obj {
    NSData *infoJSONData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONReadingAllowFragments error:nil];
    if (infoJSONData == nil || infoJSONData.length == 0)
    {
        infoJSONData = [NSData data];
    }
    NSString *infoJsonString = [[NSString alloc]initWithData:infoJSONData encoding:NSUTF8StringEncoding];
    return infoJsonString;
}

+(NSString *)getDb01BadgeValueWithBadge:(NSInteger)badge {
    if (badge == 0) {
        return nil;
    }else{
        return [NSString stringWithFormat:@"%ld",(long)badge];
    }
}
/**
 *  需要限制的正则表达式判断密码是否包含非法字符
 *
 *
 */
+(BOOL)isPassOK:(NSString *)str
{
    NSString *zhengze=@"^[^:%,'*\"\\s<>&]+$";
    NSPredicate *Zhengze=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", zhengze];
    if ([Zhengze evaluateWithObject:str]==NO) {
        
        return NO;
    }
    else
    {
        return YES;
    }
    
}

/*
 ** URL编码
 */
+(NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)input,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return outputStr;
}
/*
 ** URL解码
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
     
                               withString:@" "
     
                                  options:NSLiteralSearch
     
                                    range:NSMakeRange(0, [outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/*
 ** 生成随机字符串作为请求的msgId
 */
+(NSString *)GenerateRadStr{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < 36; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    NSLog(@"%@", string);
    return string;
}
@end
