//
//  NSString+Extension.h
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 *  NSStringmd5加密 -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5;

/**
 *  md5Hash -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5Hash;


/**
 *  过滤非法字符
 *
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
-(NSString *)filter:(NSString *)target;

/**
 * 判断密码6-12为数字
 */

+ (BOOL)checkEmployeeNumber:(NSString *)number;


/**
 *  判断邮箱是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)emailIsLegal;

/**
 *  判断手机号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)mobileIsLegal;

/**
 *  判断身份证号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)idCardIsLegal;

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
-(BOOL)isPureNumandCharacters:(NSString *)string;

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
-(BOOL)isContainChinese:(NSString *)string;

/**
 *  计算文字所占区域 -- 宽度固定，高度自适应
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font size:(CGSize)size;

/**
 *  NSStringmd5加密 -- 类方法
 *
 *  @return NSString
 */
+(NSString *) md5: (NSString *) inPutText;
/**
 *  NSStringmd5加密大写
 *
 *  @return NSString
 */
+(NSString*)md532BitUpper: (NSString *) inPutText;
/**
 *  md5Hash -- 类方法
 *
 *  @return NSString
 */
+(NSString *)md5Hash:(NSString *)md5HashString;

/**
 *  过滤非法字符
 *
 *  @param string 原字符串
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
+(NSString *)filterString:(NSString *)string target:(NSString *)target;

/**
 *  判断邮箱是否合法
 *
 *  @param email 邮箱
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)emailIsLegal:(NSString *)email;

/**
 *  判断手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)mobileIsLegal:(NSString *)mobile;

/**
 *  判断身份证号是否合法
 *
 *  @param idCard 身份证号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)idCardIsLegal:(NSString *)idCard;

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
+(BOOL)isPureNumandCharacters:(NSString *)string;

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
+(BOOL)isContainChinese:(NSString *)string;

/**
 *  计算文字所占区域 -- 宽度固定，高度自适应
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *  @param content  文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth content:(NSString *)content;

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *  @param content 文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font size:(CGSize)size content:(NSString *)content;

/*
 ** 获取指定字体大小的字符串的所占宽度
 */
+ (float)getStringWidth:(NSString *)string AndFont:(float)font;

/*
 ** 根据指定范围不同显示的字符串，返回需要的字符串
 */
+ (NSAttributedString *)getFormatStringWithSourceString:(NSString *)source KeyWordsOne:(NSString *)keyWordsOne Font:(UIFont *)font Color:(UIColor *)color;

/*
 ** 传入字符串判断是否为空，若为空写为空字符串，避免出现空指针
 */
+ (NSString *)nullString:(NSString *)string;
+ (NSString*)convertNull:(NSString *)object;
+ (BOOL)strIsNull:(NSString *)object;
/*
 ** 将对象转化为json字符串
 */
+ (NSString *)getJsonStringWithObj:(id)obj;
/**
 *  需要限制的正则表达式判断密码是否包含非法字符
 *
 *
 */
+(BOOL)isPassOK:(NSString *)str;
/*
 ** URL编码
 */
+(NSString *)encodeToPercentEscapeString: (NSString *) input;
/*
 ** URL解码
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;

/*
 ** 生成随机字符串作为请求的msgId
 */
+(NSString *)GenerateRadStr;
@end
