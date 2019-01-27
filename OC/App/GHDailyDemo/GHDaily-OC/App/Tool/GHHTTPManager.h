//
//  GHHTTPManager.h
//  Field
//
//  Created by 赵治玮 on 2017/11/8.
//  Copyright © 2017年 赵治玮. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void (^FinishedBlock)(id responseObject,NSError *error);
@interface GHHTTPManager : AFHTTPSessionManager

+ (instancetype)sharedManager;


- (void)getDataWithUrl:(NSString *)url
             parameter:(NSDictionary *)parameter
         finishedBlock:(FinishedBlock)finishedBlock;
@end
