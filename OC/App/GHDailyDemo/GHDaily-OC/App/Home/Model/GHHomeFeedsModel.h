//
//  GHHomeFeedsModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomePostModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeFeedsModel : NSObject

/**
 文章配图
 */
@property (nonatomic , copy) NSString *image;

/**
 文章类型（以此来判断cell（文章显示）的样式）
 */
@property (nonatomic , assign) NSInteger type;

@property (nonatomic , strong) GHHomePostModel *post;

@end

NS_ASSUME_NONNULL_END
