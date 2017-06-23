//
//  UIColor+Extension.h
//  布医医护
//
//  Created by 康帅 on 16/3/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  RGB颜色值获取颜色 - 三色取值
 *
 *  @param red   red
 *  @param green green
 *  @param blue  blue
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+(UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

/**
 *  RGB颜色值获取颜色 - 十六进制颜色取值
 *
 *  @param string 十六进制颜色值
 *
 *  @return UIColor
 */
+(UIColor *)colorWithHexString:(NSString *)string;

/**
 *  RGB颜色值获取颜色 - 十六进制颜色取值
 *
 *  @param string 十六进制颜色值
 *  @param alpha  透明度
 *
 *  @return UIColor
 */
+(UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;

/**
 *  获取图片颜色 -- 图片主颜色
 *
 *  @param image 目标图片
 *
 *  @return 图片主颜色
 */
+(UIColor *)getImageColor:(UIImage *)image;
+(UIColor *) randomColor;
@end
