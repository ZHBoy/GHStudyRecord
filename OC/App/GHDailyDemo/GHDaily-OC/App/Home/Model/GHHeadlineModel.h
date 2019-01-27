//
//  GHHeadlineModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHeadlineModel : NSObject

/**
 内装GHomeListModel模型
 */
@property (nonatomic , strong) NSArray *list;
@property (nonatomic , assign) NSInteger headline_genre;

@end

NS_ASSUME_NONNULL_END
