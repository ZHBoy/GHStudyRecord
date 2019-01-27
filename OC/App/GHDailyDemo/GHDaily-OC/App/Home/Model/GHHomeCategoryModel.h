//
//  GHomeCategoryModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeCategoryModel : NSObject

/**
 新闻类型（设计、娱乐、智能等)
 */
@property (nonatomic , copy) NSString *title;

@property (nonatomic , copy) NSString *normal;

@property (nonatomic , copy) NSString *normal_hl;

@property (nonatomic , copy) NSString *image_lab;

@property (nonatomic , copy) NSString *image_experiment;

@end

NS_ASSUME_NONNULL_END
