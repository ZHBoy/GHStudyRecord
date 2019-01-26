//
//  GHView.m
//  GHMasonryDemo
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHView.h"
#import "Masonry.h"
#import "UIView+Category.h"

@interface GHView()
@property (nonatomic , strong) UIView *testView;
@end
@implementation GHView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.testView];
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@50);

    }];
}

- (void)tap: (UITapGestureRecognizer *)gesture {
    if (self.changeFrameBlock) {
        self.changeFrameBlock();
    }
}

- (UIView *)testView {
    if (_testView == nil) {
        _testView = [[UIView alloc]init];
        _testView = [UIView gh_creatViewWithFrame:CGRectZero color:[UIColor redColor]];
    }
    return _testView;
}

@end
