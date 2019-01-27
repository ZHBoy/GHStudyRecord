//
//  GHWebViewController.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHWebViewController.h"

@interface GHWebViewController ()

@property (nonatomic , strong) UIWebView *webView;
@end

@implementation GHWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupUI];
    [self.webView loadHTMLString:@"http://app3.qdaily.com/app3/articles/34258.html" baseURL:nil];
}
- (void)setupUI {
    [self.view addSubview:self.webView];
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor redColor];
    }
    return _webView;
}

@end
