//
//  ViewController.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHCarouselMap.h"

@interface ViewController ()<GHCarouselMapDelegate,GHCarouselMapDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    GHCarouselMap *carouselMap = [[GHCarouselMap alloc]initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, 44)];
    carouselMap.scrollDirection = GHCarouselMapScrollDirectionVertical;
    carouselMap.dataSource = self;
    carouselMap.dalegate = self;

    [self.view addSubview:carouselMap];
}

- (NSInteger)countOfCellForCarouselMap:(GHCarouselMap *)carouselMap {
    return 4;
}

- (UIView *)carouselMap:(GHCarouselMap *)carouselMap cellAtIndex:(NSInteger)index {
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor blackColor];
    label.text = [NSString stringWithFormat:@" ★ 第%ld个hahahhahaahhahah",(long)index];
 
    return label;
    
}
@end
