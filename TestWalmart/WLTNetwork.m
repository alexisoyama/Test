//
//  WLTNetwork.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTNetwork.h"

@implementation WLTNetwork

+ (void)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *Error))failure {
    NSString *fullURL = [kAPIURL stringByAppendingString:URLString];
    [[AFHTTPSessionManager manager] GET:fullURL parameters:nil progress:nil success:success failure:failure];
}

@end
