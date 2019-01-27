//
//  GHHomeMetaModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeMetaModel : GHBaseModel

@property (nonatomic , assign) NSInteger status;

@property (nonatomic , copy) NSString *msg;

@end

NS_ASSUME_NONNULL_END
