//
//  ExchangeValue.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/8.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ExchangeValue.h"

@implementation ExchangeValue

+ (instancetype)sharedManager {
    
    static ExchangeValue *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)exchangeValueWithA: (CGFloat)a
                         b:(CGFloat)b block: (ExchangeValueBlock)block {
    int temp = a;
    a = b;
    b = temp;
    block(a,b);
}
@end
