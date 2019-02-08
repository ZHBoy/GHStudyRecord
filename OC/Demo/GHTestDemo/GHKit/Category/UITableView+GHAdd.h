//
//  UITableView+GHAdd.h
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (GHAdd)

@property (nonatomic , weak) NSArray *gh_dataArray;

- (id)gh_objectWithArray: (NSArray *)array AtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
