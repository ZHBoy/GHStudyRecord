//
//  GHHomeMetaModel.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHHomeMetaModel.h"

@implementation GHHomeMetaModel


- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super initWithDict:dict]) {
        [self parseWithDict:dict];
    }
    return self;
    
}

- (void)parseWithDict: (NSDictionary *)dict {
}

@end
