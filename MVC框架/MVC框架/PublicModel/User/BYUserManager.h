//
//  BYUserManager.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYUser.h"
@interface BYUserManager : NSObject
/**
 *  当前登陆的用户
 */
@property (nonatomic , strong) BYUser *currentUser;

/**
 *  单例实例化
 *
 *  @return 实例化之后的MDUserManager
 */
+(BYUserManager *)shareManager;

/**
 *  存储用户信息 -- 采用归档
 *
 *  @param user 用户信息
 *
 *  @return YES表示存储成功，NO表示存储失败
 */
-(BOOL)saveUserInfo:(BYUser *)user;

/**
 *  删除用户信息 -- 退出登陆时使用
 *
 *  @param complete 用户信息删除完成
 */
-(void)deleteUserInfo:(void(^)(BOOL success))complete;

/**
 *  获取登陆用户信息 -- 采用解档
 *
 *  @return 登陆用户信息
 */
-(BYUser *)getUserInfo;

/**
 *  获取用户登陆状态
 *
 *  @param complete 状态获取完成
 */
-(void)getUserState:(void(^)(LoginUserState userState))complete;
@end
