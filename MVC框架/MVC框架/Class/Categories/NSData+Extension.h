//
//  NSData+Extension.h
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSData (Extension)
/**
 *  用于将nsdata类型数据（此nsdata是UIimage转成的）转成不带两端尖括号和中间的空格的nsstring，即nsdata－>nsstring，比网上的其他所有方法都有效
 *
 *  @return 转化成的字符串
 */
-(NSString *)ConvertToNSString;
/*
 ** 获取当前时间按照一定格式
 */
+(NSString *)getcurrenttime;
/**
 *  md5
 *
 *  @return NSString
 */
-(NSString *)md5;
/**
 *  md5Hash
 *
 *  @return NSString
 */
-(NSString *)md5Hash;
+ (NSString *)compareCurrentTime:(NSString *)str;
+(NSString *)getSecondTime:(NSString *)time;
+(NSString *)getYMDHMTime:(NSString *)time;
+(NSString *)getYMDTime:(NSString *)time;
@end
