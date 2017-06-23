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



@end
