//
//  GHWaterFall.m
//  GHTestDemo
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHWaterFall.h"

/** section Header 高度 */
static const CGFloat DMDefaultHeaderHeight = 0;

/** section Footer 高度 */
static const CGFloat DMDefaultFooterHeight = 0;

/** 列数 */
static const NSInteger DMDefaultColumCount = 2;

/** 每一列间距 */
static const CGFloat DMDefaultColumMargin = 10;

/** 每一行间距 */
static const CGFloat DMDefaultRowMargin = 10;

/** 边缘间距 */
static const UIEdgeInsets DMDefaultEdgeInsets = {10,0,10,0};

@interface GHWaterFall()
/** 布局属性数组 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

/** 存放section数组，每一个section数组中存放列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeightArray;

@end
@implementation GHWaterFall
- (void)prepareLayout
{
    [super prepareLayout];
    
    //如果刷新布局就会重新调用prepareLayout这个方法,所以要先把高度数组清空
    [self.columnHeightArray removeAllObjects];
    [self.attrsArray removeAllObjects];
    
    NSInteger sectionNum = [self.collectionView numberOfSections];
    for (NSInteger sectionIndex = 0; sectionIndex < sectionNum; sectionIndex++) {
        // 获取前一个section的高度
        CGFloat tmpBottom = 0;
        if (sectionIndex != 0) {
            NSArray *beforeColumnHeightArray = [self.columnHeightArray objectAtIndex:sectionIndex - 1];
            for (NSNumber *curNum in beforeColumnHeightArray) {
                if (tmpBottom < [curNum floatValue]) {
                    tmpBottom = [curNum floatValue];
                }
            }
        }
        
        // 1.先判断是否存在section Header
        CGFloat headerHeight = [self headerHeightInSection:sectionIndex];
        if (headerHeight > 0) {
            //获取UICollectionElementKindSectionHeader对应的布局属性
            NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
            UICollectionViewLayoutAttributes *layoutHeader = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:curIndexPath];
            [self.attrsArray addObject:layoutHeader];
        }
        
        // section edge inset
        UIEdgeInsets sectionEdgeInsets = [self edgeInsetsInSection:sectionIndex];
        
        // cell
        NSInteger tmpColumnCount = [self columnCountInSection:sectionIndex];
        NSMutableArray *tmpColumnHeightArray = [[NSMutableArray alloc] init];
        for (NSInteger columnIndex = 0; columnIndex < tmpColumnCount; columnIndex++) {
            [tmpColumnHeightArray addObject:[NSNumber numberWithFloat:tmpBottom + headerHeight + sectionEdgeInsets.top]];
        }
        
        [self.columnHeightArray addObject:tmpColumnHeightArray];
        NSInteger itemsNum = [self.collectionView numberOfItemsInSection:sectionIndex];
        for (NSInteger itemIndex = 0; itemIndex < itemsNum; itemIndex++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:sectionIndex];
            //获取indexPath 对应cell 的布局属性
            UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArray addObject:attr];
        }
        
        if (sectionEdgeInsets.bottom > 0) {
            for (NSInteger columnIndex = 0; columnIndex < tmpColumnCount; columnIndex++) {
                // 更新数组中列的当前高度
                NSNumber *curHeight = tmpColumnHeightArray[columnIndex];
                tmpColumnHeightArray[columnIndex] = [NSNumber numberWithFloat:curHeight.doubleValue + sectionEdgeInsets.bottom];
            }
        }
        
        // section Footer
        CGFloat footerHeight = [self footerHeightInSection:sectionIndex];
        if (footerHeight > 0) {
            //获取UICollectionElementKindSectionFooter对应的布局属性
            NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
            UICollectionViewLayoutAttributes *layoutFooter = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:curIndexPath];
            [self.attrsArray addObject:layoutFooter];
            for (NSInteger columnIndex = 0; columnIndex < tmpColumnCount; columnIndex++) {
                // 更新数组中列的当前高度
                NSNumber *curHeight = tmpColumnHeightArray[columnIndex];
                tmpColumnHeightArray[columnIndex] = [NSNumber numberWithFloat:curHeight.doubleValue + footerHeight];
            }
        }
    }
}

/**
 *  返回supplementaryView对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *tempAttr = nil;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
        NSInteger sectionIndex = indexPath.section;
        CGFloat headerOriginY = 0;
        // 前一个section的高度
        if (sectionIndex != 0) {
            NSArray *beforeColumnHeightArray = [self.columnHeightArray objectAtIndex:sectionIndex - 1];
            for (NSNumber *curNum in beforeColumnHeightArray) {
                if (headerOriginY < [curNum floatValue]) {
                    headerOriginY = [curNum floatValue];
                }
            }
        }
        
        CGFloat headerHeight = [self headerHeightInSection:sectionIndex];
        // 设置frame
        attr.frame = CGRectMake(0, headerOriginY, [UIScreen mainScreen].bounds.size.width, headerHeight);
        tempAttr = attr;
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        NSInteger sectionIndex = indexPath.section;
        CGFloat footerOriginY = 0;
        NSArray *curColumnHeightArray = [self.columnHeightArray objectAtIndex:sectionIndex];
        for (NSNumber *curNum in curColumnHeightArray) {
            if (footerOriginY < [curNum floatValue]) {
                footerOriginY = [curNum floatValue];
            }
        }
        
        UICollectionViewLayoutAttributes *layoutFooter = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:indexPath];
        CGFloat footerHeight = [self footerHeightInSection:sectionIndex];
        // 设置frame
        layoutFooter.frame = CGRectMake(0, footerOriginY, [UIScreen mainScreen].bounds.size.width, footerHeight);
        
        tempAttr = layoutFooter;
    }
    
    return tempAttr;
}

/**
 *  返回indexPath 位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger sectionIndex = indexPath.section;
    NSMutableArray *curColumnHeightArray =  [self.columnHeightArray objectAtIndex:sectionIndex];
    
    // 获取前一个section的高度
    CGFloat tmpBottom = 0;
    if (sectionIndex != 0) {
        NSArray *beforeColumnHeightArray = [self.columnHeightArray objectAtIndex:sectionIndex - 1];
        for (NSNumber *curNum in beforeColumnHeightArray) {
            if (tmpBottom < [curNum floatValue]) {
                tmpBottom = [curNum floatValue];
            }
        }
    }
    
    // 当前section的section header
    CGFloat headerHeight = [self headerHeightInSection:sectionIndex];
    if (headerHeight > 0) {
        tmpBottom += headerHeight;
    }
    
    // section edge inset
    UIEdgeInsets sectionEdgeInsets = [self edgeInsetsInSection:sectionIndex];
    
    CGFloat sectionColumnMargin =  [self columnMarginInSection:sectionIndex];
    CGFloat sectionRowMargin =  [self rowMarginInSection:sectionIndex];
    
    //使用for循环,找出高度最短的那一列
    //最短高度的列(即存放当前cell的列)
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [curColumnHeightArray[0] doubleValue];
    
    NSInteger tmpColumnCount = [self columnCountInSection:sectionIndex];
    for (NSInteger i = 1; i < tmpColumnCount; i++) {
        CGFloat columnHeight  = [curColumnHeightArray[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    //cell item的宽度
    CGFloat w = (self.collectionView.frame.size.width - sectionEdgeInsets.left - sectionEdgeInsets.right - (tmpColumnCount - 1) * sectionColumnMargin ) / tmpColumnCount;
    //cell item的高度
    CGFloat h = [self.delegate waterfallFlowLayout:self heightForItemAtIndexPath:indexPath itemWidth:w];
    //cell item的起点x
    CGFloat x = sectionEdgeInsets.left + destColumn * (w + sectionColumnMargin);
    //cell item的起点y
    CGFloat y = minColumnHeight ;
    
    // 当前cell不是分区的第一行cell 时 添加一个行Margin
    if (y != tmpBottom + sectionEdgeInsets.top) {
        y += sectionRowMargin;
    }
    
    // 设置frame
    attr.frame = CGRectMake(x,y,w,h);
    
    // 修改数组中当前列的高度
    curColumnHeightArray[destColumn] =  [NSNumber numberWithFloat:y+ h];
    
    return attr;
}

/**
 *  决定UICollectionView的排布
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 *  可滑动范围
 */
- (CGSize)collectionViewContentSize
{
    CGFloat maxHeight = 0;
    NSInteger sectionNum = [self.collectionView numberOfSections];
    
    if (sectionNum > 0) {
        NSArray *curColumnHeightArray = [self.columnHeightArray objectAtIndex:sectionNum - 1];
        for (NSNumber *curNum in curColumnHeightArray) {
            if (maxHeight < [curNum floatValue]) {
                maxHeight = [curNum floatValue];
            }
        }
    }
    
    return CGSizeMake(0, maxHeight);
}

#pragma mark - public method
- (CGFloat)headerHeightInSection:(NSInteger)section
{
    CGFloat tempHeaderHeight = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:heightForHeaderInSection:)]) {
        tempHeaderHeight = [self.delegate waterfallFlowLayout:self heightForHeaderInSection:section];
    } else {
        tempHeaderHeight = DMDefaultHeaderHeight;
    }
    
    return tempHeaderHeight;
}

- (CGFloat)footerHeightInSection:(NSInteger)section
{
    CGFloat tempHeaderHeight = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:heightForFooterInSection:)]) {
        tempHeaderHeight = [self.delegate waterfallFlowLayout:self heightForFooterInSection:section];
    } else {
        tempHeaderHeight = DMDefaultFooterHeight;
    }
    
    return tempHeaderHeight;
}

- (NSInteger)columnCountInSection:(NSInteger)section
{
    NSInteger tempColumn = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:columnCountInSection:)]) {
        tempColumn = [self.delegate waterfallFlowLayout:self columnCountInSection:section];
    } else {
        tempColumn = DMDefaultColumCount;
    }
    
    return tempColumn;
}

- (CGFloat)columnMarginInSection:(NSInteger)section
{
    CGFloat tempColumnMargin = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:columnMarginInSection:)]) {
        tempColumnMargin = [self.delegate waterfallFlowLayout:self columnMarginInSection:section];
    } else {
        tempColumnMargin = DMDefaultColumMargin;
    }
    
    return tempColumnMargin;
}

- (CGFloat)rowMarginInSection:(NSInteger)section
{
    CGFloat tempRowMargin = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:rowMarginInSection:)]) {
        tempRowMargin = [self.delegate waterfallFlowLayout:self rowMarginInSection:section];
    } else {
        tempRowMargin = DMDefaultRowMargin;
    }
    
    return tempRowMargin;
}

- (UIEdgeInsets)edgeInsetsInSection:(NSInteger)section
{
    UIEdgeInsets tempEdgeInset = UIEdgeInsetsZero;
    if (self.delegate && [self.delegate respondsToSelector:@selector(waterfallFlowLayout:edgeInsetsInSection:)]) {
        tempEdgeInset = [self.delegate waterfallFlowLayout:self edgeInsetsInSection:section];
    } else {
        tempEdgeInset = DMDefaultEdgeInsets;
    }
    
    return tempEdgeInset;
}

#pragma mark - getter and setter
- (NSMutableArray *)attrsArray
{
    if (_attrsArray == nil) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    
    return _attrsArray;
}

- (NSMutableArray *)columnHeightArray {
    if (_columnHeightArray == nil) {
        _columnHeightArray = [[NSMutableArray alloc] init];
    }
    
    return _columnHeightArray;
}
@end
