//
//  NSDictionary+GHAdd.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "NSDictionary+GHAdd.h"

@implementation NSDictionary (GHAdd)

//重写系统的方法控制输出
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *string = [NSMutableString string];
    
    //{}
    [string appendString:@"{\n"];
    
    //拼接key--value
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [string appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [string appendString:@"                                    }"];
    //删除逗号
    //从后往前搜索 得到的是搜索到的第一个符号的位置
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    
    return string;
}

@end
