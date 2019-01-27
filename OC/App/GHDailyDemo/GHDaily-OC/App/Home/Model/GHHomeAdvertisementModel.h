//
//  GHHomeAdvertisementModel.h
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHHomeAdvertisementModel : NSObject

@property (nonatomic , copy) NSString *feedback_url;

@property (nonatomic , copy) NSString *own_feedback_url;

@property (nonatomic , assign) NSInteger ad_location;

@property (nonatomic , assign) NSInteger ad_type;

@property (nonatomic , copy) NSString *ad_url;

@property (nonatomic , assign) NSInteger title_reveal;

@property (nonatomic , copy) NSString *ad_icon_url;

@property (nonatomic , assign) NSInteger wifi_location;

@property (nonatomic , copy) NSString *app_type;

@property (nonatomic , assign) BOOL macro_replace_status;

@end

NS_ASSUME_NONNULL_END
