//
//  UIView+DotterLine.h
//  DottedLine
//
//  Created by Ali on 16/8/29.
//  Copyright © 2016年 Ali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DotterLine)
/**
 *  @author Ali
 *
 *  画出一条横向的虚线  注意:size.height 就是线条的高度
 *
 *  @param lineLength  单个线条长度
 *  @param lineSpacing 单个线条间距
 *  @param lineColor   单个线条颜色
 *
 *  @return 将当前view画出一条横向的虚线  注意:view.size.height 就是线条的高度
 */
- (void)drawTransverseDotterLineWithLength:(CGFloat)lineLength lineSpacing:(CGFloat)lineSpacing lineColor:(UIColor *)lineColor;


/**
 *  @author Ali
 *
 *  将当前view画出一条竖向的虚线  注意:view.size.wight 就是线条的宽度
 *
 *  @param lineLength  单个线条长度
 *  @param lineSpacing 单个线条间距
 *  @param lineColor   单个线条颜色
 *
 *  @return 将当前view画出一条竖向的虚线  注意:view.size.wight 就是线条的宽度
 */
- (void)drawVerticalDotterLineWithHeight:(CGFloat)lineHeight lineSpacing:(CGFloat)lineSpacing lineColor:(UIColor *)lineColor;


/**
 *  @author Ali
 *
 *  给当前view 添加虚线边框
 *
 *  @param lineWight    线条宽(粗)度
 *  @param lineLength   单个线条长度
 *  @param lineSpacing  单个线条间距
 *  @param lineColor    线条颜色
 *  @param cornerRadius 圆角
 *
 *  @return 给当前view 添加虚线边框
 */
-(void)drawRectDotterLineWithLineWight:(CGFloat)lineWight lineLength:(CGFloat)lineLength lineSpacing:(CGFloat)lineSpacing lineColor:(UIColor *)lineColor  cornerRadius:(CGFloat)cornerRadius;



//
@end
