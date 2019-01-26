//
//  ViewController.m
//  GHMasonryDemo
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GHView *view = [[GHView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.changeFrameBlock = ^{
        NSLog(@"1");
    };
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}


@end
