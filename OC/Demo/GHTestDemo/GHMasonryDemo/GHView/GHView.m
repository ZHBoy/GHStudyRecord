//
//  GHView.m
//  GHMasonryDemo
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHView.h"
#import "Masonry.h"
#import "UIView+GHAdd.h"
#import "UILabel+GHAdd.h"


@interface GHView()
@property (nonatomic , strong) UIView *testView;
@property (nonatomic , strong) UILabel *label;

@end
@implementation GHView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@50);
    }];
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [UILabel gh_creatLabelWithFrame:CGRectZero text:@"adahsduhauidhadioaoisdjaiojsdiaoidjao isdjaiosdjoiajsdoi ajdsiasdj o " textColor:[UIColor redColor] font:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentLeft];
        _label.textNormalColor = [UIColor redColor];
        _label.textSeletedColor = [UIColor blueColor];
        _label.backgroundColor = [UIColor redColor];
        _label.seleted = YES;
        _label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];

        [_label addGestureRecognizer:tap];

//        [_label gh_addGestureRecognizerWithTarget:self action:^{
//        }];
    }
    return _label;
}
- (void)tap: (UITapGestureRecognizer *)gesture {
    
    NSLog(@"222222");
    
}
- (UIView *)testView {
    if (_testView == nil) {
        _testView = [[UIView alloc]init];
        _testView = [UIView gh_creatViewWithFrame:CGRectZero color:[UIColor redColor]];
        [_testView gh_addShadow];
    }
    return _testView;
}

@end

