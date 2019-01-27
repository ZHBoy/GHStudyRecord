//
//  GHomeBannersModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomePostModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHomeBannersModel : NSObject

@property (nonatomic , copy) NSString *image;

@property (nonatomic , assign) NSInteger type;

@property (nonatomic , strong) GHHomePostModel *post;

@end

NS_ASSUME_NONNULL_END
