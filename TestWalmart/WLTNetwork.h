//
//  WLTNetwork.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLTGlobal.h"
#import <AFNetworking/AFNetworking.h>

@interface WLTNetwork : NSObject

+ (void)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *Error))failure;

@end
