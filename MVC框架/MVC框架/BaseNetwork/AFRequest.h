//
//  AFRequest.h
//  JKFuwuRenYuan
//
//  Created by why on 16/10/8.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^DownloadProgress)(int64_t bytesProgress,
int64_t totalBytesProgress);
@interface AFRequest : NSObject
#pragma mark - POST请求
/**
 *  更新POST请求接口
 *
 *  @param url           请求地址
 *  @param parameters    请求参数
 *  @param success       成功回调
 *  @param fail          失败回调
 */
+ (void)POSTWithURL:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail;


#pragma mark - GET请求
/**
 *  更新GET请求接口
 *
 *  @param url           请求地址
 *  @param parameter     请求参数
 *  @param success       成功回调
 *  @param fail          失败回调
 */
+ (void)GETWithURL:(NSString *)url parameter:(id)parameter success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail;

#pragma mark - 上传图片

/**
 *  上传图片
 *
 *  @param url              请求地址
 *  @param parameter        参数
 *  @param name             服务器名字
 *  @param images           图片文件
 *  @param success          成功回调
 *  @param fail             失败回调
 */
+ (void)POSTImageWithURL:(NSString *) url
                                 parameter:(NSDictionary *) parameter
                                      name:(NSString *)name
                               imagesArray:(NSArray *)images
                          success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail;
#pragma mark - 下载文件方法
/**
 *  下载文件方法
 *  @param url               下载地址
 *  @param saveToPath        文件保存的路径,如果不传则保存到Cache的,defaultVoicedata目录下，以文件本来的名字命名
 *  @param progressBlock     下载进度回调
 *  @param success           下载完成
 *  @param fail              失败
 */
+ (NSURLSessionTask *)downloadWithUrl:(NSString *)url
                           saveToPath:(NSString *)saveToPath
                             progress:(DownloadProgress)progressBlock
                              success:(void(^)(id responseObject))success
                                 fail:(void (^)(NSError *error))fail;

@end
