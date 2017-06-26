//
//  BYUser.h
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  登陆用户状态
 */
typedef NS_ENUM(NSInteger , LoginUserState) {
    /**
     *  在线 -- 登陆成功后更改为在线
     */
    isOnLine = 0,
    /**
     *  离线 -- 退出登陆后更改为离线
     */
    isOffLine = 1
};

@interface BYUser : NSObject<NSCoding>
/**
 *  登陆用户的状态
 */
@property (nonatomic , assign) LoginUserState userState;

/**
 *  用户登陆 -- 为手机号，也可扩展为其他
 */
@property (nonatomic , strong) NSString *userName; //nurse_name 介护真实姓名
/**
 *  电话
 */
@property (nonatomic, strong) NSString *userTel;  //nurse_tel  介护电话号码
/**
 *  性别
 */
@property (nonatomic, strong) NSString *userGender;  //nurse_gender   介护性别
/**
 *  年龄
 */
@property (nonatomic, strong) NSString *userAge;   //nurse_age   介护年龄

/**
 *  用户ID
 */
@property (nonatomic , strong) NSString *userID;   //nurseId 介护id
/**
 *  用户真实姓名
 */
@property (nonatomic , strong) NSString *realName;
/**
 *  用户头像
 */
@property (nonatomic , strong) NSString *Headurl; //nurse_img 用户头像地址
/**
 *  服务人员ID
 */
@property (nonatomic , strong) NSString *perID;
/**
 *  用户上传头像以后本地缓存的字符串
 */
@property (nonatomic , strong) NSString *userHeadstr; //用户头像缓存本地

/**
 *  用户的身份证号码
 */
@property (nonatomic, strong) NSString *idcard;  //nurse_idcard 介护身份证号码

/**
 *  注册时间
 */
@property (nonatomic, strong) NSString *userRegTime;  //nurse_reg_time  注册时间


@end
