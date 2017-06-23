//
//  NSData+Extension.m
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "NSData+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Extension)

/**
 *  用于将nsdata类型数据（此nsdata是UIimage转成的）转成不带两端尖括号和中间的空格的nsstring，即nsdata－>nsstring，比网上的其他所有方法都有效
 *
 *  @return 转化成的字符串
 */
-(NSString *)ConvertToNSString{
    
    
    NSMutableString *strTemp = [NSMutableString stringWithCapacity:[self length]*2];
    
    
    const unsigned char *szBuffer = [self bytes];
    
    
    for (NSInteger i=0; i < [self length]; ++i) {
        
        [strTemp appendFormat:@"%02lx",(unsigned long)szBuffer[i]];
        
    }
    
    
    return strTemp;
    
}

/*
 ** 获取当前时间按照一定格式
 */
+(NSString *)getcurrenttime
{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    return dateString;
}

/**
 *  md5
 *
 *  @return NSString
 */
-(NSString *)md5
{
    CC_MD5_CTX md5;
    
    CC_MD5_Init(&md5);
    
    BOOL done = NO;
    while(!done)
    {
        CC_MD5_Update(&md5, [self bytes], (unsigned int)[self length]);
        if( [self length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    return [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            digest[0], digest[1],
            digest[2], digest[3],
            digest[4], digest[5],
            digest[6], digest[7],
            digest[8], digest[9],
            digest[10], digest[11],
            digest[12], digest[13],
            digest[14], digest[15]];
}

/**
 *  md5Hash
 *
 *  @return NSString
 */
-(NSString *)md5Hash
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (int)[self length], result);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}
/**
 * Given the reference date and return a pretty date string to show
 *
 * @param refrence the date to refrence
 *
 * @return a pretty date string, like "just now", "1 minute ago", "2 weeks ago", etc
 */
+ (NSString *) compareCurrentTime:(NSString *)str
{
    BJLog(@"%@",str);
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
         return  result;
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
        return  result;
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
        return  result;
    }
    return  nil;
}
+(NSString *)getSecondTime:(NSString *)time{
    /**
     传入时间转NSDate类型
     */
    NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSince1970:[time longLongValue]/1000.0];
        /**
     初始化并定义Formatter
     
     :returns: NSDate
     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
    
    /**
     *  使用Formatter格式化时间（传入时间和当前时间）为NSString
     */
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
//    return [timeStr substringWithRange:NSMakeRange(1, 10)];
    return timeStr;
}
+(NSString *)getYMDHMTime:(NSString *)time{
    /**
     传入时间转NSDate类型
     */
    NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSince1970:[time longLongValue]/1000.0];
    /**
     初始化并定义Formatter
     
     :returns: NSDate
     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
    
    /**
     *  使用Formatter格式化时间（传入时间和当前时间）为NSString
     */
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
        return [timeStr substringWithRange:NSMakeRange(0, 16)];
}
+(NSString *)getYMDTime:(NSString *)time{
    /**
     传入时间转NSDate类型
     */
    NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSince1970:[time longLongValue]/1000.0];
    /**
     初始化并定义Formatter
     
     :returns: NSDate
     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
    
    /**
     *  使用Formatter格式化时间（传入时间和当前时间）为NSString
     */
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
    return [timeStr substringWithRange:NSMakeRange(0, 10)];
}
@end
