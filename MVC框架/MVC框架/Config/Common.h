//
//  Common.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#ifndef Common_h
#define Common_h
/*
 ** 系统Frame
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define RATIOW SCREEN_WIDTH/375
#define RATIOH SCREEN_HEIGHT/667
#define AppFrame(x,y,width,height)     CGRectMake((x),(y),(width),(height))
#define SCALEW(width)   width*SCREEN_WIDTH/375
#define SCALEH(height)  height*SCREEN_HEIGHT/667


#define DEBUG 1
#if DEBUG// 处于开发阶段
#define BJLog(...) NSLog(__VA_ARGS__)
#else// 处于发布阶段
#define BJLog(...)
#endif



#define PHOTO_HEAD @"downloadFile?path="
#define PHOTO_SERVER  [SERVER stringByReplacingOccurrencesOfString:@"service" withString:@"mobile"]

#define kNurse_Id   [BYUserManager shareManager].currentUser.userID

#define WenAn @"系统繁忙,请稍后再试"

#define File   [NSUserDefaults standardUserDefaults]

#pragma mark - 存token字段
#define DefaultToken @"token"
#define AutoLogin  @"AutoLogin"

#define rightRow @"icon_arrowright"
#define resetImg @"icon_reset"
#define Cell_Height 45*RATIOH

#endif /* Common_h */
