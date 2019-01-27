//
//  GHHomeBannersAdModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHHomePostModel.h"
#import "GHHomeAdvertisementModel.h"
#import "GHHomeCoverModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeBannersAdModel : NSObject

@property (nonatomic , copy) NSString *image;

@property (nonatomic , assign) NSInteger type;

@property (nonatomic , strong) GHHomePostModel *post;

@property (nonatomic , strong) GHHomeAdvertisementModel *advertisement;
@property (nonatomic , strong) GHHomeCoverModel *cover;

@end

NS_ASSUME_NONNULL_END
