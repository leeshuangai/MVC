//
//  UIViewController+Extension.m
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (Extension)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}





- (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5?200.0f:150.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}


#pragma mark - 加载框提示

-(void)showLoad:(NSString *)title View:(UIView *)view {
    [self hideHUDWithView:view];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.margin = 10;
    hud.labelColor = [UIColor grayColor];
    hud.dimBackground = NO;
    
    UIView *waitingView = [[UIView alloc] initWithFrame:AppFrame(0, 0, 60, 60)];
    
    UIImageView *animation = [[UIImageView alloc] initWithFrame:AppFrame(0, 0, 60, 60)];
    animation.image = [UIImage imageNamed:@"hud_waiting_animation"];
    [waitingView addSubview:animation];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:AppFrame(0, 0, 60, 60)];
    logo.image = [UIImage imageNamed:@"hud_waiting_logo"];
    [waitingView addSubview:logo];
    
    hud.customView = waitingView;
    
    /**
     *  动画显示
     */
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [animation.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    if ([title length]>0) {
        hud.labelText = title;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
}

-(void)hideHUDWithView:(UIView *)view{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)hideHud{
    [[self HUD] hide:YES];
}

- (void)showTextDialog{
    //初始化进度框，置于当前的View当中
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    
    //设置对话框文字
//    HUD.labelText = @"请稍等";
    
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
//        sleep(3);
    } completionBlock:^{
        //操作执行完后取消对话框
//        [HUD removeFromSuperview];
//        [HUD release];
//        HUD = nil;
    }];
}
//获取当前屏幕显示的viewcontroller
-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}
@end
