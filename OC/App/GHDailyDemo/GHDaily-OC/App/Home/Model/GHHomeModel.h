//
//  GHHomeModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomeMetaModel.h"
#import "GHHomeResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeModel : NSObject

@property (nonatomic , strong) GHHomeMetaModel *meta;

@property (nonatomic , strong) GHHomeResponseModel *response;

@end

NS_ASSUME_NONNULL_END
