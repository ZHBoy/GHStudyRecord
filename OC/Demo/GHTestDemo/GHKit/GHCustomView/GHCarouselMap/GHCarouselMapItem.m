//
//  GHCarouselMapItem.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/2/6.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHCarouselMapItem.h"

@interface GHCarouselMapItem()
@property (nonatomic , strong) UIImageView *imageView;
@end

@implementation GHCarouselMapItem

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
@end
