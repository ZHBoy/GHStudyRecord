//
//  GHHTTPManager.m
//  Field
//
//  Created by 赵治玮 on 2017/11/8.
//  Copyright © 2017年 赵治玮. All rights reserved.
//

#import "GHHTTPManager.h"

@implementation GHHTTPManager
+ (instancetype)sharedManager {
    
    static GHHTTPManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@""];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 20;
        [_instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        _instance = [[self alloc] initWithBaseURL:baseUrl sessionConfiguration:config];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"text/plain", @"application/x-www-form-urlencoded",@"text/javascript", nil];
        });
    
    return _instance;
}


- (void)getDataWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter
         finishedBlock:(FinishedBlock)finishedBlock {
    
    [[GHHTTPManager sharedManager] GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishedBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishedBlock(nil,error);
    }];
}

@end
