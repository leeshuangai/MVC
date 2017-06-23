//
//  AFRequest.h
//  JKFuwuRenYuan
//
//  Created by why on 16/10/8.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface AFRequest : NSObject

/**
 *  更新POST请求接口
 *
 *  @param url     <#url description#>
 *  @param parameters    <#body description#>
 *  @param success <#success description#>
 *  @param fail    <#fail description#>
 */
+ (void)POSTWithURL:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success fail:(void (^)(NSError *error))fail;

@end
