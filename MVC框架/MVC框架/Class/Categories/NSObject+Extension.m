//
//  NSObject+Extension.m
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "NSObject+Extension.h"

/**
 *  默认下载文件存储位置
 */
#define DefaultKeyedArchiverPath @"%@/Library/Caches/BYInfoPath"

@implementation NSObject (Extension)

/**
 *  归档
 *
 *  @param obj 需要归档的类
 *  @param key 归档key
 *
 *  @return YES表示成功，NO表示失败
 */
+(BOOL)keyedArchiver:(id)obj key:(NSString *)key
{
    //构建path
    BOOL creatSavePathSuccess = [self creatSavePath];
    if (creatSavePathSuccess)
    {
        return [self keyedArchiver:obj key:key path:[self getKeyedArchiverPath:key]];
    }
    else
    {
        return NO;
    }
}

/**
 *  归档
 *
 *  @param obj  需要归档的类
 *  @param key  归档key
 *  @param path 归档路劲
 *
 *  @return YES表示归档成功，NO表示归档失败
 */
+(BOOL)keyedArchiver:(id)obj key:(NSString *)key path:(NSString *)path
{
    NSMutableData *tpData = [NSMutableData data];
    NSKeyedArchiver *keyedArchiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:tpData];
    [keyedArchiver encodeObject:obj forKey:key];
    [keyedArchiver finishEncoding];
    return [tpData writeToFile:path atomically:YES];
}

/**
 *  解档
 *
 *  @param key key
 *
 *  @return 解析的结果
 */
+(id)keyedUnarchiver:(NSString *)key
{
    return [self keyedUnarchiver:key path:[self getKeyedArchiverPath:key]];
}

/**
 *  解档
 *
 *  @param key  解挡key
 *  @param path 解挡路径
 *
 *  @return 解析的结果
 */
+(id)keyedUnarchiver:(NSString *)key path:(NSString *)path
{
    NSMutableData *tpData = [NSMutableData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *keyedUnarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:tpData];
    return [keyedUnarchiver decodeObjectForKey:key];
}

/**
 *  创建文件夹路径
 *
 *  @return YES表示创建成功，NO表示创建失败
 */
+(BOOL)creatSavePath
{
    BOOL success = NO;
    NSString *pathString = [NSString stringWithFormat:DefaultKeyedArchiverPath, NSHomeDirectory()];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    BOOL dataSavePathExist = [fileManager fileExistsAtPath:pathString];
    if (dataSavePathExist == NO)
    {
        //路径不存在，则创建
        BOOL creatResult = [fileManager createDirectoryAtPath:pathString withIntermediateDirectories:YES attributes:nil error:nil];
        if (creatResult == YES)
        {
            NSLog(@"创建文件下载路径成功");
            success = YES;
        }
        else
        {
            NSLog(@"创建文件下载路径失败");
            success = NO;
        }
    }
    else
    {
        NSLog(@"文件下载路径已创建");
        success = YES;
    }
    return success;
}

+(NSString *)getKeyedArchiverPath:(NSString *)keyString
{
    NSString *path = [NSString stringWithFormat:[NSString stringWithFormat:@"%@/%@",DefaultKeyedArchiverPath,keyString.md5],NSHomeDirectory()];
    return path;
}
@end
