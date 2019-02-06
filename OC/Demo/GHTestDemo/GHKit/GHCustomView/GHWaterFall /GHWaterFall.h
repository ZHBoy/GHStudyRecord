//
//  GHWaterFall.h
//  GHTestDemo
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GHWaterFall;
@protocol GHWaterFallDelegate <NSObject>
@required
/**
 *  cell 高度
 */
- (CGFloat)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width;

@optional
/**
 * 分区 sectionHeader 高度
 */
- (CGFloat)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout heightForHeaderInSection:(NSInteger)section;

/**
 * 分区 sectionFooter 高度
 */
- (CGFloat)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout heightForFooterInSection:(NSInteger)section;

/**
 *  分区 列数
 */
- (NSInteger)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout columnCountInSection:(NSInteger)section;

/**
 *  分区 列间距
 */
- (CGFloat)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout columnMarginInSection:(NSInteger)section;

/**
 *  分区 行间距
 */
- (CGFloat)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout rowMarginInSection:(NSInteger)section;

/**
 *  分区 UIEdgeInsets
 */
- (UIEdgeInsets)waterfallFlowLayout:(GHWaterFall *)waterfallFlowLayout edgeInsetsInSection:(NSInteger)section;

@end

@interface GHWaterFall : UICollectionViewFlowLayout

@property (nonatomic, weak) id<GHWaterFallDelegate> delegate;

- (CGFloat)headerHeightInSection:(NSInteger)section;

- (CGFloat)footerHeightInSection:(NSInteger)section;

- (NSInteger)columnCountInSection:(NSInteger)section;

- (CGFloat)columnMarginInSection:(NSInteger)section;

- (CGFloat)rowMarginInSection:(NSInteger)section;

- (UIEdgeInsets)edgeInsetsInSection:(NSInteger)section;


@end

NS_ASSUME_NONNULL_END
