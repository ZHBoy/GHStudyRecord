//
//  UITableView+GHAdd.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "UITableView+GHAdd.h"
#import <objc/runtime.h>

static NSString *ghDataArrayKey = @"ghDataArrayKey";

@implementation UITableView (GHAdd)

- (void)setGhDataArray:(NSArray *)ghDataArray {
    objc_setAssociatedObject(self, &ghDataArrayKey, ghDataArray, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray *)ghDataArray {
    NSArray *array = objc_getAssociatedObject(self, &ghDataArrayKey);
    if (array == nil) {
        array = [NSArray array];
        objc_setAssociatedObject(self, &ghDataArrayKey, array, OBJC_ASSOCIATION_RETAIN);
    }
    return array;
}

- (id)gh_objectWithArray: (NSArray *)array AtIndex:(NSUInteger)index;{
    if (array.count > index) {
        return [array objectAtIndex:index];
    } else {
        return nil;
    }
}
@end
