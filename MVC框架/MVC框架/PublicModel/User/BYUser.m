//
//  BYUser.m
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/29.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYUser.h"

@implementation BYUser
-(id)init
{
    self = [super init];
    if (self)
    {
        self.userState = isOffLine;
        self.userName = @"";
        self.userTel = @"";
        self.userAge= @"";
        self.userGender = @"";
        self.perID = @"";
        self.userHeadstr=@"";
        self.userID=@"";
        self.realName=@"";
        self.Headurl=@"";
        self.idcard = @"";
        self.userRegTime = @"";
    }
    return self;
}
/**
 *  归档
 *
 *  @param aCoder 归档
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
   
    [aCoder encodeInteger:self.userState forKey:@"userState"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.perID forKey:@"perID"];
    [aCoder encodeObject:self.userHeadstr forKey:@"userHeadstr"];
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.realName forKey:@"realName"];
    [aCoder encodeObject:self.Headurl forKey:@"Headurl"];
    
    [aCoder encodeObject:self.userAge forKey:@"userAge"];
    [aCoder encodeObject:self.userGender forKey:@"userGender"];
    [aCoder encodeObject:self.userTel forKey:@"userTel"];
    [aCoder encodeObject:self.idcard forKey:@"idcard"];
    [aCoder encodeObject:self.userRegTime forKey:@"userRegTime"];
}
/**
 *  解挡
 *
 *  @param aDecoder 解挡
 *
 *  @return 解挡后的对象
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.userState = [aDecoder decodeIntegerForKey:@"userState"];
        self.userName= [aDecoder decodeObjectForKey:@"userName"];
        self.perID= [aDecoder decodeObjectForKey:@"perID"];
        self.userHeadstr= [aDecoder decodeObjectForKey:@"userHeadstr"];
        self.userID= [aDecoder decodeObjectForKey:@"userID"];
        self.realName= [aDecoder decodeObjectForKey:@"realName"];
        self.Headurl= [aDecoder decodeObjectForKey:@"Headurl"];
        
        self.userAge= [aDecoder decodeObjectForKey:@"userAge"];
        self.userGender= [aDecoder decodeObjectForKey:@"userGender"];
        self.userTel= [aDecoder decodeObjectForKey:@"userTel"];
        self.idcard= [aDecoder decodeObjectForKey:@"idcard"];
        self.userRegTime= [aDecoder decodeObjectForKey:@"userRegTime"];
        
        
    }
    return self;
}
@end
