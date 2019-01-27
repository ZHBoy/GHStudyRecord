//
//  GHHomeResponseModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHBaseModel.h"
#import "GHHomeFeedsModel.h"
#import "GHHomeBannersModel.h"
#import "GHHomeColumnsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeResponseModel : GHBaseModel

@property (nonatomic , assign) NSInteger my_subscription_location;

@property (nonatomic , assign) BOOL has_more;

@property (nonatomic , copy) NSString *last_key;

/**
 数组 内装GHHomeFeedsModel模型
 */
@property (nonatomic , strong) NSArray *feeds;

/**
 数组 内装GHomeBannersModel模型
 */
@property (nonatomic , strong) NSArray *banners;

@property (nonatomic , strong) NSArray *headline;

@property (nonatomic , strong) NSArray *featured_article;

@property (nonatomic , strong) NSArray *columns;

@property (nonatomic , strong) NSArray *banners_ad;

@property (nonatomic , strong) NSArray *feeds_ad;

@property (nonatomic , strong) NSArray *columns_ad;

@end

NS_ASSUME_NONNULL_END
