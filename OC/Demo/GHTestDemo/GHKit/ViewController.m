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

    GHCarouselMap *carouselMap = [[GHCarouselMap alloc]initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, 300)];
    carouselMap.dalegate = self;
    carouselMap.dataSource = self;

    carouselMap.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:carouselMap];
    
}

- (NSInteger)countOfCellForCarouselMap:(GHCarouselMap *)carouselMap {
    return 4;
}

- (UIView *)carouselMap:(GHCarouselMap *)carouselMap cellAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", (long)index + 1]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    label.text = [NSString stringWithFormat:@"第%ld个",(long)index + 1];
    label.textColor = [UIColor whiteColor];
    [imageView addSubview:label];
    return imageView;
}

- (void)carouselMap: (GHCarouselMap *) carouselMap didSelectRowAtIndex:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}

@end
