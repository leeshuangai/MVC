//
//  NSDate+Extension.h
//  JKFuwuRenYuan
//
//  Created by boocca on 16/11/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  字符串转NSDate
 *
 *  @param theTime 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return <#return value description#>
 */
+ (NSDate *)dateFromString:(NSString *)timeStr
                    format:(NSString *)format;

/**
 *  NSDate转时间戳
 *
 *  @param date 字符串时间
 *
 *  @return 返回时间戳
 */
+ (NSInteger)cTimeStampFromDate:(NSDate *)date;

/**
 *  字符串转时间戳
 *
 *  @param theTime 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳
 */
+ (NSInteger)cTimestampFromString:(NSString *)timeStr
                           format:(NSString *)format;


/**
 *  字符串转时间戳字符串
 *
 *  @param theTime 字符串时间
 *  @param format  转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回时间戳字符串
 */

+(NSString *)cTimestampStringFromString:(NSString *)timeStr
                                 format:(NSString *)format;


/**
 *  时间戳转字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)dateStrFromCstampTime:(NSInteger)timeStamp Format:(NSString *)format;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate时间
 *  @param format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format;


/**
 *  字符串时间戳转化为时间字符串
 *
 *  @param timeStampStr 字符串类型的时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)dateStrFromCstampTimeStr:(NSString *)timeStampStr;


/**
 *  字符串时间戳转化为时间字符串 指定时间格式转换
 *
 *  @param timeStampStr  字符串类型的时间戳
 *  @param dateFormatter 指定时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)dateStrFromCstampTimeStr:(NSString *)timeStampStr withDateFormatter:(NSString *)dateFormatter;


/**
 *  <#Description#>
 *
 *  @param timeStr 时间字符串
 *  @param sepStr  分割的字符串
 *
 *  @return 分割字符串的数组
 */
+ (NSArray *)separteTimeStr:(NSString *)timeStr sepStr:(NSString *)sepStr;


/**
 *  获取当前时间戳
 *
 *  @return <#return value description#>
 */
+ (NSString *)getTimeStamp;

/**
 *  将时间戳转换成NSDate,转换的时间为格林尼治时间
 *
 *  @param spString 时间戳
 *
 *  @return NSDate
 */
+ (NSDate *)changeSpToTime:(NSString*)spString;


/**
 *  将时间戳转换成NSDate,转换的时间为北京时间
 *
 *  @param spString 时间戳
 *
 *  @return NSDate
 */
+ (NSDate*)zoneChange:(NSString*)spString;


/**
 *  比较给定NSDate与当前时间的时间差
 *
 *  @param date 给定NSDate
 *
 *  @return 返回相差的秒数
 */
+ (long)timeDifference:(NSDate *)date;


/**
 *  将NSDate按yyyy-MM-dd HH:mm:ss格式时间输出
 *
 *  @param date NSDate
 *
 *  @return <#return value description#>
 */
+ (NSString*)nsdateToString:(NSDate *)date;


/**
 *  将yyyy-MM-dd HH:mm:ss格式时间转换成时间戳
 *
 *  @param timeStr 字符串类型的时间
 *
 *  @return long类型的时间
 */
+ (long)changeTimeToTimeSp:(NSString *)timeStr;


/**
 *  获取当前系统的yyyy-MM-dd HH:mm:ss格式时间
 *
 *  @return <#return value description#>
 */
+ (NSString *)getTimeDate;


/**
 *  指定时间格式获取系统当前时间
 *
 *  @param dateFormatter 时间格式
 *
 *  @return <#return value description#>
 */
+ (NSString *)getTimeDateWithDateFormatter:(NSString *)dateFormatter;

/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;

/**获取指定时间的时间戳*/
+ (NSDate *)dateTotimeStampWithHour:(NSInteger)hour minutes:(NSInteger)minutes;


/**
 *  比较两个date
 *
 *  @param date      <#date description#>
 *  @param otherDate <#otherDate description#>
 *
 *  @return 相隔天数
 */
+ (NSInteger)compareWithDate:(NSString *)date otherDate:(NSString *)otherDate;

/**
 *  获取当前时间
 *
 *  @param formaterStr 指定格式
 *
 *  @return <#return value description#>
 */
+(NSString *)getCurrentDateWithDateFormatterStr:(NSString *)formaterStr;

/*
 ** 计算某个日期n天之后的(单个)日期
 */
+(NSString *)GetTomorrowDay:(NSDate *)aDate AndDay:(NSInteger)index;


@end
