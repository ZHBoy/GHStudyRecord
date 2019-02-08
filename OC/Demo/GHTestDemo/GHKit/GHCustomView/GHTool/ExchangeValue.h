//
//  ExchangeValue.h
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ExchangeValueBlock)(CGFloat a,CGFloat b);
@interface ExchangeValue : NSObject

+ (instancetype)sharedManager;

- (void)exchangeValueWithA:(CGFloat)a
                         b:(CGFloat)b
                     block: (ExchangeValueBlock)block;

@end

NS_ASSUME_NONNULL_END
