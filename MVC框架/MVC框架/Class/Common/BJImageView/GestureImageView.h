//
//  GestureImageView.h
//  BJNurse
//
//  Created by boocca on 16/12/7.
//  Copyright © 2016年 李爽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureImageView : UIImageView
//添加点击后执行的block
@property (copy,nonatomic) void (^action)();

/**
 *  按钮以block样式返回的触发方法
 *
 *  @param completion 响应的回调
 */
- (void)addTapOfImageView:(void(^)())completion;
@end
