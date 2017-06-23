//
//  BYTool.m
//  JKFuwuRenYuan
//
//  Created by 康帅 on 16/6/30.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYTool.h"
#import "sys/utsname.h"
#import "UICKeyChainStore.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
/**
 *  UUID存储Service
 */
#define MyUUIDService @"MyUUIDService"
/**
*  定义的UUID取值关键字
*/
#define UUIDKey @"UUID"
@implementation BYTool
/*
 ** 获取手机型号
 */
+(NSString *)getIphoneClass
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSArray *modelArray = @[
                            
                            @"i386", @"x86_64",
                            
                            @"iPhone1,1",
                            @"iPhone1,2",
                            @"iPhone2,1",
                            @"iPhone3,1",
                            @"iPhone3,2",
                            @"iPhone3,3",
                            @"iPhone4,1",
                            @"iPhone5,1",
                            @"iPhone5,2",
                            @"iPhone5,3",
                            @"iPhone5,4",
                            @"iPhone6,1",
                            @"iPhone6,2",
                            @"iPhone7,1",
                            @"iPhone7,2",
                            @"iPhone8,1",
                            @"iPhone8,2",
                            
                            @"iPod1,1",
                            @"iPod2,1",
                            @"iPod3,1",
                            @"iPod4,1",
                            @"iPod5,1",
                            
                            @"iPad1,1",
                            @"iPad2,1",
                            @"iPad2,2",
                            @"iPad2,3",
                            @"iPad2,4",
                            @"iPad3,1",
                            @"iPad3,2",
                            @"iPad3,3",
                            @"iPad3,4",
                            @"iPad3,5",
                            @"iPad3,6",
                            
                            @"iPad2,5",
                            @"iPad2,6",
                            @"iPad2,7",
                            ];
    NSArray *modelNameArray = @[
                                
                                @"iPhone Simulator", @"iPhone Simulator",
                                
                                @"iPhone 2G",
                                @"iPhone 3G",
                                @"iPhone 3GS",
                                @"iPhone 4(GSM)",
                                @"iPhone 4(GSM Rev A)",
                                @"iPhone 4(CDMA)",
                                @"iPhone 4S",
                                @"iPhone 5(GSM)",
                                @"iPhone 5(GSM+CDMA)",
                                @"iPhone 5c(GSM)",
                                @"iPhone 5c(Global)",
                                @"iphone 5s(GSM)",
                                @"iphone 5s(Global)",
                                @"iPhone 6 Plus (A1522/A1524)",
                                @"iPhone 6 (A1549/A1586)",
                                @"iPhone 6S (A1633/A1688/A1691/A1700)",
                                @"iPhone 6S Plus(A1634/A1687/A1690/A1699)",
                                
                                @"iPod Touch 1G",
                                @"iPod Touch 2G",
                                @"iPod Touch 3G",
                                @"iPod Touch 4G",
                                @"iPod Touch 5G",
                                
                                @"iPad",
                                @"iPad 2(WiFi)",
                                @"iPad 2(GSM)",
                                @"iPad 2(CDMA)",
                                @"iPad 2(WiFi + New Chip)",
                                @"iPad 3(WiFi)",
                                @"iPad 3(GSM+CDMA)",
                                @"iPad 3(GSM)",
                                @"iPad 4(WiFi)",
                                @"iPad 4(GSM)",
                                @"iPad 4(GSM+CDMA)",
                                
                                @"iPad mini (WiFi)",
                                @"iPad mini (GSM)",
                                @"ipad mini (GSM+CDMA)"
                                ];
    NSInteger modelIndex = - 1;
    NSString *modelNameString = nil;
    modelIndex = [modelArray indexOfObject:deviceString];
    if (modelIndex >= 0 && modelIndex < [modelNameArray count]) {
        modelNameString = [modelNameArray objectAtIndex:modelIndex];
    }
    return modelNameString;
}


/**
 * 获取当前系统语言
 */

+(NSString*)getPreferredLanguage
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSLog(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}


/*
 ** 获取UUID
 */
+(NSString *)UUID
{
    /**
     *  从设备钥匙串中读取uuid，如果能够读取到设备的uuid，则将uuid赋值给self.uuid；否则生成一个新的uuid，并保存到钥匙串中，同时赋值给self.uuid。
     */
    NSString *uuidString = [UICKeyChainStore stringForKey:UUIDKey service:MyUUIDService accessGroup:nil];
    if (uuidString == nil || uuidString.length == 0)
    {
        uuidString = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [UICKeyChainStore setString:uuidString forKey:UUIDKey service:MyUUIDService accessGroup:nil];
    }
    
    BJLog(@"uuidString === %@",uuidString);
    return uuidString;
}
/*
 ** 读取应用的版本号
 */
+(NSString *)AppVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    //    NSString *shortVersion = [infoDic getStringValueForKey:@"CFBundleShortVersionString" defaultValue:@"1.0"];
    NSString *buideVersion = [infoDic getStringValueForKey:@"CFBundleVersion"];
    NSString *resultstr= [NSString stringWithFormat:@"%@",buideVersion];
    return resultstr;
}
/*
 ** 获取系统版本
 */
+(NSString *)iphoneSystem
{
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
}
/*
 ** 根据long型字符串获取年月日
 */
+(NSString *)getdayTime:(NSString *)time{
    /**
     传入时间转NSDate类型
     */
    NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSince1970:[time longLongValue]/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy年MM月dd日";
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
    return timeStr;
}
+(BOOL)CheckalbumAuthorization{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限
        return NO;
    }else{
        return YES;
    }
}
+(BOOL)CheckcameraAuthorization{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied){
        //无权限
        return NO;
    }else{
        return YES;
    }
}

+ (NSString *)timeDifference:(NSDate *)date
{
    
 
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]*1000];
    
    return timeSp;
}
/*
 ** 计算某个日期n天之后的(单个)日期
 */
+(NSString *)GetTomorrowDay:(NSDate *)aDate AndDay:(NSInteger)index
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+index)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

+ (NSString *)getToday{
    
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *temdate = [formatter stringFromDate:[NSDate date]];
    return [NSString stringWithString:temdate];
    
}
/*
 ** 判断当前设备是否被用户同意接受通知
 */
+(BOOL)CheckPush
{
    UIRemoteNotificationType types;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        types = (UIRemoteNotificationType)[[UIApplication sharedApplication] currentUserNotificationSettings].types;
    }
    else
    {
        types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    }
    return (types & UIRemoteNotificationTypeAlert);
}

/**
 * 数组转换成json
 */

+ (NSString *)arrChangeJson:(NSMutableArray *)arr {
    
    NSData *data =[NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
    NSString *JSONData =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return JSONData;
}



/*
 ** 发送本地通知
 */
+(void)sendLocalNotification:(NSString *)str
{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    //多少秒钟之后触发
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:.2];
    notification.alertBody =str;
    // 设置重复间隔
    notification.repeatInterval = 0;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber++;
    notification.userInfo=[NSDictionary dictionaryWithObjectsAndKeys:str,@"content", nil];
    // 要调用本地通知，需要通过UIApplication来统一调度
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
/**
 *获得当前屏幕的viewcontroller
 */
-(UIViewController *)getCurrentRootViewController {
    UIViewController *result;
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows)
        {
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
    {
        result = topWindow.rootViewController;
    }
    else{
        
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
    }
    return result;
}
/*
 ** 正则表达式检验身份证号
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//
+ (BOOL) passwordIsLegal:(NSString *)pass {
    
    NSString *Regex = @"\\w{6,16}";
    
    NSPredicate *tPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    
    if ([tPredicate evaluateWithObject:pass]) {
        
        return YES ;
        
    }
    
    return NO;
    

}

//空值处理
+(BOOL)objectIsNull:(id)object{
    
    // 转换空串
    
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object==nil){
        return NO;
    }else{
        return YES;
    }
    
    
}
@end
