//
//  GHHomeHeader.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHHomeHeader.h"

@interface GHHomeHeader()
@property (nonatomic , strong) SDCycleScrollView *cycleScrollView;
@end
@implementation GHHomeHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.cycleScrollView];
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (SDCycleScrollView *)cycleScrollView {
    if (_cycleScrollView == nil) {
        _cycleScrollView = [[SDCycleScrollView alloc]init];
    }
    return _cycleScrollView;
}
@end
