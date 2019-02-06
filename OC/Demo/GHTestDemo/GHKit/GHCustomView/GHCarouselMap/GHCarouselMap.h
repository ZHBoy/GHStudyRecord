//
//  GHCarouselMap.h
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GHCarouselMap;
@protocol GHCarouselMapDataSource <NSObject>
@required
/**
 设置轮播图个数

 @param carouselMap carouselMap
 @return 轮播图个数
 */
- (NSInteger)countOfCellForCarouselMap:(GHCarouselMap *)carouselMap;

- (UIView *)carouselMap:(GHCarouselMap *)carouselMap cellAtIndex:(NSInteger)index;

@end
@protocol GHCarouselMapDelegate <NSObject>

- (void)carouselMap: (GHCarouselMap *) carouselMap didSelectRowAtIndex:(NSInteger)index;
@end

@interface GHCarouselMap : UIView

@property (nonatomic , weak) id <GHCarouselMapDataSource> dataSource;
@property (nonatomic , weak) id <GHCarouselMapDelegate> dalegate;

@end

NS_ASSUME_NONNULL_END
