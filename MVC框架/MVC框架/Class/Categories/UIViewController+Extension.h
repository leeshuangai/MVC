//
//  UIViewController+Extension.h
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

- (void)showHintWithEunm:(NSInteger)eunm;
// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;
#pragma mark - 加载框提示

-(void)showLoad:(NSString *)title View:(UIView *)view;
-(void)hideHUDWithView:(UIView *)view;
- (void)showTextDialog;
//获取当前屏幕显示的viewcontroller
-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController;
@end
