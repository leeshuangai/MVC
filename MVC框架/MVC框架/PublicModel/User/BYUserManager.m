//
//  BYUserManager.m
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYUserManager.h"
static BYUserManager *byUserManager;
@implementation BYUserManager
/**
 *  单例实例化
 *
 *  @return 实例化之后的MDUserManager
 */
+(BYUserManager *)shareManager
{
    @synchronized(self)
    {
        if (byUserManager == nil)
        {
            byUserManager = [[self alloc]init];
        }
    }
    return byUserManager;
}
-(id)init
{
    self = [super init];
    if (self)
    {
        [self initiaCurrentUser];
        [self addObserverForLoginUser];
    }
    return self;
}
-(void)initiaCurrentUser
{
    BYUser *tpUser = [[NSObject class]keyedUnarchiver:@"loginUser"];
    if (tpUser == nil)
    {
        tpUser = [[BYUser alloc]init];
    }
    _currentUser = tpUser;
}
/**
 *  添加KVO观察
 */
-(void)addObserverForLoginUser
{
    [self.currentUser addObserver:self forKeyPath:@"userState" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
   // [self.currentUser addObserver:self forKeyPath:@"ServiceState" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"perID" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userHeadstr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"userID" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    //[self.currentUser addObserver:self forKeyPath:@"IsRequesting" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"realName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    [self.currentUser addObserver:self forKeyPath:@"Headurl" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
}
/**
 *  监听KVO键值变化
 *
 *  @param keyPath 关键KEY
 *  @param object  监听对象
 *  @param change  改变信息描述
 *  @param context context
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    /**
     *  键值有变化则执行信息归档
     */
    [self saveUserInfo:_currentUser];
    
}
/**
 *  存储用户信息 -- 采用归档
 *
 *  @param user 用户信息
 *
 *  @return YES表示存储成功，NO表示存储失败
 */
-(BOOL)saveUserInfo:(BYUser *)user;
{
    if ([[NSObject class]keyedArchiver:user key:@"loginUser"]) {
        BJLog(@"存储成功");
    }
    return [[NSObject class]keyedArchiver:user key:@"loginUser"];
}
/**
 *  删除用户信息 -- 退出登陆时使用
 *
 *  @param complete 用户信息删除完成
 */
-(void)deleteUserInfo:(void(^)(BOOL success))complete
{
    BYUser *tpUser = [[BYUser alloc]init];
    tpUser.userState =1;
   // tpUser.ServiceState =1;
    tpUser.userName =@"";
    tpUser.perID = @"";
    tpUser.userHeadstr = @"";
    tpUser.userID = @"";
    //tpUser.IsRequesting = @"";
    tpUser.realName = @"";
    tpUser.Headurl = @"";
    
    BOOL success = [[NSObject class]keyedArchiver:tpUser key:@"loginUser"];
    
    _currentUser.userState = tpUser.userState;
    //_currentUser.ServiceState = tpUser.ServiceState;
    _currentUser.userName = tpUser.userName;
    _currentUser.perID = tpUser.perID;
    _currentUser.userHeadstr = tpUser.userHeadstr;
    _currentUser.userID = tpUser.userID;
   // _currentUser.IsRequesting = tpUser.IsRequesting;
    _currentUser.realName = tpUser.realName;
    _currentUser.Headurl = tpUser.Headurl;
    complete(success);
}
/**
 *  获取登陆用户信息，默认取最后一条用户数据
 *
 *  @return 登陆用户信息
 */
-(BYUser *)getUserInfo
{
    return _currentUser;
}
/**
 *  获取用户登陆状态
 *
 *  @param complete 状态获取完成
 */
-(void)getUserState:(void(^)(LoginUserState userState))complete
{
    /**
     *  登陆状态从沙盒中获取
     */
    if (complete)
    {
        complete(self.currentUser.userState);
    }
}
/**
 *  清理
 */
-(void)dealloc
{
    [self.currentUser removeObserver:self forKeyPath:@"userState"];
    //[self.currentUser removeObserver:self forKeyPath:@"ServiceState"];
    [self.currentUser removeObserver:self forKeyPath:@"userName"];
    [self.currentUser removeObserver:self forKeyPath:@"perID"];
    [self.currentUser removeObserver:self forKeyPath:@"userHeadstr"];
    [self.currentUser removeObserver:self forKeyPath:@"userID"];
   // [self.currentUser removeObserver:self forKeyPath:@"IsRequesting"];
    [self.currentUser removeObserver:self forKeyPath:@"realName"];
    [self.currentUser removeObserver:self forKeyPath:@"Headurl"];
}
@end
