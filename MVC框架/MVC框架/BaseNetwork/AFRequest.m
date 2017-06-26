//
//  AFRequest.m
//  JKFuwuRenYuan
//
//  Created by why on 16/10/8.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "AFRequest.h"

@implementation AFRequest
#pragma mark - 验证证书
+ (AFSecurityPolicy *)customSecurityPolicy {
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"boocaaNurse" ofType:@"cer"];//证书的路径
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [[NSSet alloc]initWithObjects:cerData, nil];
    return securityPolicy;
}


+ (void)POSTWithURL:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail{
    
    /* 1.创建 HTTP请求管理者 */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
   
    /* 2.加上这个函数，https ssl 验证 */
      //[manager setSecurityPolicy:[AFRequest customSecurityPolicy]];

  
    /* 3.POST 请求 */
    [manager POST:url parameters:parameters  progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
           
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];

    
}

+ (void)GETWithURL:(NSString *)url parameter:(id)parameter success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url
      parameters:parameter
        progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
                
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                fail(error);
            }
        }];
}


+ (void)POSTImageWithURL:(NSString *) url
               parameter:(NSDictionary *) parameter
                    name:(NSString *)name
             imagesArray:(NSArray *)images
                 success:(void(^)(id responseObject))success
                    fail:(void (^)(NSError *error))fail {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url
       parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
           for (UIImage *image in images) {
               // 设置时间格式(给个时间便于区分)
               NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
               formatter.dateFormat = @"yyyyMMddHHmmss";
               NSString *fileName = [formatter stringFromDate:[NSDate date]];
               NSData *imageData;
               if (UIImagePNGRepresentation(image) == nil) {
                   imageData = UIImageJPEGRepresentation(image, 1);
               } else {
                   imageData = UIImagePNGRepresentation(image);
               }
               [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
           }
       } progress:^(NSProgress * _Nonnull uploadProgress) {
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           if (success) {
               success(responseObject);
               
           }
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           if (error) {
               fail(error);
           }
       }];
}

+ (NSURLSessionTask *)downloadWithUrl:(NSString *)url
                           saveToPath:(NSString *)saveToPath
                              progress:(DownloadProgress)progressBlock
                              success:(void(^)(id responseObject))success
                                 fail:(void (^)(NSError *error))fail {
    
  
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    
    
    NSURLSessionTask *sessionTask = nil;
    sessionTask = [manager downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"下载进度--%.1f",1.0 * downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
        //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (progressBlock) {
                progressBlock(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
            }
        });
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        if ([saveToPath isEqualToString:@""]  || saveToPath == nil) {
            NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"defaultVoicedata"];
            NSURL *defaultDownloadURL = [NSURL fileURLWithPath:filePath];
            
            return [defaultDownloadURL URLByAppendingPathComponent:[response suggestedFilename]];
        }else{
            return [NSURL fileURLWithPath:saveToPath];
        }
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"下载文件成功");
       
        if (error == nil) {
            if (success) {
                success([filePath path]);//返回完整路径
            }
        } else {
            if (fail) {
                fail(error);
            }
        }
    }];
    //开始启动任务
    [sessionTask resume];
    
    return sessionTask;
}

@end
