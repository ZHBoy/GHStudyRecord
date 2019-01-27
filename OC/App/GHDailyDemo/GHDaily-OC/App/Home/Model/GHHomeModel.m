//
//  GHHomeModel.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHHomeModel.h"
#import "GHHomeMetaModel.h"
#import "GHHomeResponseModel.h"
#import "GHHomeFeedsModel.h"
#import "GHHomePostModel.h"
#import "GHHomeCategoryModel.h"
#import "GHHomeColumnsModel.h"
#import "GHHomeBannersModel.h"

@implementation GHHomeModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super initWithDict:dict]) {
        [self parseWithDict:dict];
    }
    return self;
    
}

- (void)parseWithDict: (NSDictionary *)dict {
    NSDictionary *meta = dict[@"dict"];
    GHHomeMetaModel *metaModel = [GHHomeMetaModel mj_objectWithKeyValues:meta];
    self.meta = metaModel;
    NSDictionary *response = dict[@"response"];
    GHHomeResponseModel *responseModel = [GHHomeResponseModel mj_objectWithKeyValues:response];
    self.response = responseModel;
    
    NSArray *feeds = response[@"feeds"];
    NSMutableArray *feedsArray = [NSMutableArray array];
    for (NSDictionary *feedsDict in feeds) {
        GHHomeFeedsModel *feedsModel = [GHHomeFeedsModel mj_objectWithKeyValues:feedsDict];
        NSDictionary *postDict = feedsDict[@"post"];
        GHHomePostModel *postModel = [GHHomePostModel mj_objectWithKeyValues:postDict];
        NSDictionary *categoryDict = postDict[@"category"];
        feedsModel.post = postModel;
        GHHomeCategoryModel *categoryModel = [GHHomeCategoryModel mj_objectWithKeyValues:categoryDict];
        postModel.category = categoryModel;
        NSDictionary *columnDict = postDict[@"column"];
        GHHomeColumnsModel *columnsModel = [GHHomeColumnsModel mj_objectWithKeyValues:columnDict];
        postModel.column = columnsModel;
        [feedsArray addObject:feedsModel];
    }
    responseModel.feeds = feedsArray.copy;
    
    NSArray *banners = response[@"banners"];
    NSMutableArray *bannersArray = [NSMutableArray array];
    for (NSDictionary *bannersDict in banners) {
        GHHomeBannersModel *bannersModel = [GHHomeBannersModel mj_objectWithKeyValues:bannersDict];
        
        NSDictionary *postDict = bannersDict[@"post"];
        GHHomePostModel *postModel = [GHHomePostModel mj_objectWithKeyValues:postDict];
        bannersModel.post = postModel;
        NSDictionary *categoryDict = postDict[@"category"];
        GHHomeCategoryModel *categoryModel = [GHHomeCategoryModel mj_objectWithKeyValues:categoryDict];
        postModel.category = categoryModel;
        
        NSDictionary *columnDict = postDict[@"column"];
        GHHomeColumnsModel *columnsModel = [GHHomeColumnsModel mj_objectWithKeyValues:columnDict];
        
        postModel.column = columnsModel;
        [bannersArray addObject:bannersModel];
    }
    responseModel.banners = bannersArray.copy;
}

@end
