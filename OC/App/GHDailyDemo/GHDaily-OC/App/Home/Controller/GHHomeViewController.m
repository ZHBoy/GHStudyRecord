//
//  GHHomeViewController.m
//  GHDaily-OC
//
//  Created by zhaozhiwei on 2019/1/27.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHHomeViewController.h"
#import "GHHTTPManager.h"
#import "GHHomeHeader.h"

@interface GHHomeViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) GHHomeHeader *header;

@end
@implementation GHHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.header;
    
}

- (void)loadData {
    
    [[GHHTTPManager sharedManager] getDataWithUrl:kUrl parameter:nil finishedBlock:^(id responseObject, NSError *error) {
        NSLog(@"responseObject%@",responseObject);
        NSLog(@"error%@",error);

    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}


- (GHHomeHeader *)header {
    if (_header == nil) {
        _header = [[GHHomeHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    }
    return _header;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kSafeAreaTopHeight, kScreenWidth, kScreenHeight - kSafeAreaTopHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
    }
    return _tableView;
}
@end
