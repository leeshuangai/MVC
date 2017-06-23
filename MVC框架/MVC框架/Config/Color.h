//
//  Color.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#ifndef Color_h
#define Color_h
/*
 ** 整体的风格颜色
 */
#define StyleColor  [UIColor colorWithHexString:@"#ba77ff"]
#pragma mark - 下方tabbar的颜色
#define TabbarColor [UIColor whiteColor]
#pragma mark - 默认背景的颜色
#define Backcolor   [UIColor colorWithHexString:@"#f3f3f3"]
#pragma mark - 灰色
#define gray [UIColor colorWithHexString:@"#999999"]
#pragma mark - 透明色
#define clear [UIColor clearColor]
#pragma mark - #f8f8f8
#define f8f8f8 [UIColor colorWithHexString:@"#f8f8f8"]

//#define grayLineColor [UIColor colorWithHexString:@"#999999"]

#define mark - #414141
#define darkGray [UIColor colorWithHexString:@"#414141"]

#define grayLine [UIColor colorWithR:221 G:221 B:221 A:1]

#define normalWhite [UIColor colorWithHexString:@"ffffff"]

/*
 ** RGB颜色
 */
#define BJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#endif /* Color_h */
