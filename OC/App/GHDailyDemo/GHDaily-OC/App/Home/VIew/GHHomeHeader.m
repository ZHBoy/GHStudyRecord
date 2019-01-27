//
//  GHHomeHeader.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHHomeHeader.h"
#import "GHHomeBannersModel.h"
#import "GHHomeFeedsModel.h"
#import "GHHomePostModel.h"
#import "GHHomeCategoryModel.h"
#import "GHHomeColumnsModel.h"

@interface GHHomeHeader()
@property (nonatomic , strong) SDCycleScrollView *cycleScrollView;
@end
@implementation GHHomeHeader

- (void)setBanners:(NSArray *)banners {
    _banners = banners;
    
    NSMutableArray *imageUrls = [NSMutableArray array];
    NSMutableArray *titles = [NSMutableArray array];

    for (GHHomeBannersModel *bannersModel in banners) {
        [imageUrls addObject:bannersModel.post.image];
        [titles addObject:bannersModel.post.title];
    }
    self.cycleScrollView.imageURLStringsGroup = imageUrls.copy;
    self.cycleScrollView.titlesGroup = titles.copy;

}

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
