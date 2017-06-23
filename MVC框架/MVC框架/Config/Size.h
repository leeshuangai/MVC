//
//  Size.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#ifndef Size_h
#define Size_h
/*
 ** 常用字体
 */
#define FONT8                           [UIFont systemFontOfSize:8]
#define FONT9                           [UIFont systemFontOfSize:9]
#define FONT10                         [UIFont systemFontOfSize:10]
#define FONT11                         [UIFont systemFontOfSize:11]
#define FONT12                         [UIFont systemFontOfSize:12]
#define FONT13                         [UIFont systemFontOfSize:13]
#define FONT14                         [UIFont systemFontOfSize:14]
#define FONT15                         [UIFont systemFontOfSize:15]
#define FONT16                         [UIFont systemFontOfSize:16]
#define FONT17                         [UIFont systemFontOfSize:17]
#define FONT18                         [UIFont systemFontOfSize:18]
#define FONT19                         [UIFont systemFontOfSize:19]
#define FONT20                         [UIFont systemFontOfSize:20]
#define FONT21                         [UIFont systemFontOfSize:21]
#define FONT22                         [UIFont systemFontOfSize:22]
#define FONT24                         [UIFont systemFontOfSize:24]
#define FONT25                         [UIFont systemFontOfSize:25]
#define FONT26                         [UIFont systemFontOfSize:26]
#define FONT27                         [UIFont systemFontOfSize:27]
#define FONT28                         [UIFont systemFontOfSize:28]
#define FONT29                         [UIFont systemFontOfSize:29]
#define FONT30                         [UIFont systemFontOfSize:30]
#define FONT36                         [UIFont systemFontOfSize:36]

#define FONT(size)  [UIFont systemFontOfSize:size*RATIOW]
/*
 ** 判断手机的型号和手机尺寸
 */
#ifdef DEBUG

/**
 *  iPhone4以及iPhone4s -- 3.5吋屏
 */
#define _IPHONE4_4s (SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 480.0)?YES:NO

/**
 *  iPhone5、5c以及5s -- 4.0吋屏
 */
#define _IPHONE5_5c_5s (SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 568.0)?YES:NO

/**
 *  iPhone6 -- 4.7吋屏
 */
#define _IPHONE6 (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 667.0)?YES:NO

/**
 *  iPhone6plus -- 5.5吋屏
 */
#define _IPHONE6p ((SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 736.0 ) || (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667))?YES:NO

#else

/**
 *  iPhone4以及iPhone4s -- 3.5吋屏
 */
#define _IPHONE4_4s ([SDVersion deviceVersion] == iPhone4 || [SDVersion deviceVersion] == iPhone4S)?YES:NO

/**
 *  iPhone5、5c以及5s -- 4.0吋屏
 */
#define _IPHONE5_5c_5s ([SDVersion deviceVersion] == iPhone5 || [SDVersion deviceVersion] == iPhone5C || [SDVersion deviceVersion] == iPhone5S)?YES:NO

/**
 *  iPhone6 -- 4.7吋屏
 */
#define _IPHONE6 ([SDVersion deviceVersion] == iPhone6 || [SDVersion deviceVersion] == iPhone6S)?YES:NO

/**
 *  iPhone6plus -- 5.5吋屏
 */
#define _IPHONE6p ([SDVersion deviceVersion] == iPhone6Plus || [SDVersion deviceVersion] == iPhone6SPlus)?YES:NO
#endif
#endif /* Size_h */
