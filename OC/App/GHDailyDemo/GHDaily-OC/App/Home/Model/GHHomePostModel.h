//
//  GHHomePostModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomeCategoryModel.h"
#import "GHHomeColumnsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomePostModel : NSObject


@property (nonatomic , assign) NSInteger genre;

/**
 新闻标题
 */

@property (nonatomic , copy) NSString *title;

@property (nonatomic , copy) NSString *description;

/**
 出版时间
 */
@property (nonatomic , assign) NSInteger publish_time;

/**
 配图
 */
@property (nonatomic , copy) NSString *image;

@property (nonatomic , assign) NSInteger start_time;

/**
 评论数
 */
@property (nonatomic , assign) NSInteger comment_count;

@property (nonatomic , assign) BOOL comment_status;

/**
 点赞数
 */
@property (nonatomic , assign) NSInteger praise_count;

@property (nonatomic , assign) NSInteger super_tag;

@property (nonatomic , assign) NSInteger page_style;

@property (nonatomic , assign) NSInteger post_id;

/**
 新闻文章链接（html格式)
 */
@property (nonatomic , copy) NSString *appview;

@property (nonatomic , copy) NSString *film_length;

@property (nonatomic , copy) NSString *datatype;

@property (nonatomic , strong) GHHomeCategoryModel *category;

@property (nonatomic , strong) GHHomeColumnsModel *column;

@end

NS_ASSUME_NONNULL_END
