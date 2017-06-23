//
//  BYButton.h
//  JKFuwuRenYuan
//
//  Created by boocca on 16/11/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYButton : UIButton
//添加点击后执行的block
@property (copy,nonatomic) void (^action)(UIButton *button);

/**
 *  按钮以block样式返回的触发方法
 *
 *  @param completion 响应的回调
 */
- (void)addActionOfButton:(void(^)(UIButton *button))completion;
@end
