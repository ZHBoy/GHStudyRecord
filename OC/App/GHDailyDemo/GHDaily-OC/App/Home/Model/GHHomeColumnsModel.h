//
//  GHomeColumnsModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomeShareModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeColumnsModel : NSObject

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *description;

@property (nonatomic , assign) BOOL subscribe_status;

@property (nonatomic , copy) NSString *icon;

@property (nonatomic , copy) NSString *image;

@property (nonatomic , copy) NSString *image_large;

@property (nonatomic , copy) NSString *content_provider;

@property (nonatomic , assign) NSInteger show_type;

@property (nonatomic , assign) NSInteger genre;

@property (nonatomic , assign) NSInteger subscriber_num;

@property (nonatomic , assign) NSInteger post_count;

@property (nonatomic , copy) NSString *sort_time;

@property (nonatomic , copy) NSString *column_tag;

@property (nonatomic , assign) NSInteger location;

@property (nonatomic , strong) NSDictionary *share;

@end

NS_ASSUME_NONNULL_END
