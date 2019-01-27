//
//  GHHomeModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHBaseModel.h"

@class GHHomeMetaModel,GHHomeResponseModel;
NS_ASSUME_NONNULL_BEGIN

@interface GHHomeModel : GHBaseModel

@property (nonatomic , strong) GHHomeMetaModel *meta;

@property (nonatomic , strong) GHHomeResponseModel *response;

@end

NS_ASSUME_NONNULL_END
