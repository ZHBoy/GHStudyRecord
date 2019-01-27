//
//  GHHomePostModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHomeCategoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomePostModel : NSObject

@property (nonatomic , assign) NSInteger genre;

@property (nonatomic , copy) NSString *title;

@property (nonatomic , copy) NSString *description;

@property (nonatomic , assign) NSInteger publish_time;

@property (nonatomic , copy) NSString *image;

@property (nonatomic , assign) NSInteger start_time;

@property (nonatomic , assign) NSInteger comment_count;

@property (nonatomic , assign) BOOL comment_status;

@property (nonatomic , assign) NSInteger praise_count;

@property (nonatomic , assign) NSInteger super_tag;

@property (nonatomic , assign) NSInteger page_style;

@property (nonatomic , assign) NSInteger post_id;

@property (nonatomic , copy) NSString *appview;

@property (nonatomic , copy) NSString *film_length;

@property (nonatomic , copy) NSString *datatype;

@property (nonatomic , strong) GHomeCategoryModel *category;


@end

NS_ASSUME_NONNULL_END
