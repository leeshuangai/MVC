//
//  UIBarButtonItem+Extension.h
//  界面下方的TabBar控件
//
//  Created by 康帅 on 15/12/16.
//  Copyright © 2015年 康帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
/**
 *  创建一个item
 *  @param highImage 文字
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action text:(NSString *)str;
@end
