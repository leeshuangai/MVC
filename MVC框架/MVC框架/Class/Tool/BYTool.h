//
//  BYTool.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/30.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYTool : NSObject
/**
 * 获取当前系统语言
 */

+(NSString*)getPreferredLanguage;
/*
 ** 获取手机型号
 */
+(NSString *)getIphoneClass;
/*
 ** 获取UUID
 */
+(NSString *)UUID;
/*
 ** 读取应用的版本号
 */
+(NSString *)AppVersion;
/*
 ** 获取系统版本
 */
+(NSString *)iphoneSystem;
/*
 ** 根据long型字符串获取年月日
 */
+(NSString *)getdayTime:(NSString *)time;
/**
 * 日期转换成long
 */

+ (NSString *)timeDifference:(NSDate *)date;
/*
 ** 检测手机的相册访问权限
 */
+(BOOL)CheckalbumAuthorization;
/*
 ** 检测手机的照相机访问权限
 */
+(BOOL)CheckcameraAuthorization;

/*
 ** 计算某个日期n天之后的(单个)日期
 */

+(NSString *)GetTomorrowDay:(NSDate *)aDate AndDay:(NSInteger)index;
/**
 * 获取当天日期
 */
+ (NSString *)getToday;

/**
 * 数组转换成json字符串
 */

+ (NSString *)arrChangeJson:(NSMutableArray *)arr;
/*
 ** 判断当前设备是否被用户同意接受通知
 */

+(BOOL)CheckPush;
/*
 ** 发送本地通知
 */
+(void)sendLocalNotification:(NSString *)str;
/**
 *获得当前屏幕的viewcontroller
 */
-(UIViewController *)getCurrentRootViewController;
/*
 ** 正则表达式检验身份证号
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
/*
 ** 正则表达式检验登录密码
 */
+ (BOOL) passwordIsLegal:(NSString *)pass;


/**
 *  空值处理
 */

+(BOOL)objectIsNull:(id)object;
@end
