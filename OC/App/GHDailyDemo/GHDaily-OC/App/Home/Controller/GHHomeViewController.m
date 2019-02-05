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
#import "GHHomeModel.h"
#import "GHHomeMetaModel.h"
#import "GHHomeResponseModel.h"
#import "GHHomeFeedsModel.h"
#import "GHHomePostModel.h"
#import "GHHomeCategoryModel.h"
#import "GHHomeColumnsModel.h"
#import "GHHomeBannersModel.h"
#import "GHWebViewController.h"

@interface GHHomeViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) GHHomeHeader *header;
@property (nonatomic , strong) GHHomeModel *homeModel;

@end
@implementation GHHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
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
        GHHomeModel *homeModel = [[GHHomeModel alloc]initWithDict:responseObject];
        self.homeModel = homeModel;
        NSLog(@"homeModel%@",self.homeModel);
        self.header.banners = homeModel.response.banners;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[GHWebViewController new] animated:YES];

}

- (GHHomeHeader *)header {
    if (_header == nil) {
        _header = [[GHHomeHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    }
    return _header;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
    }
    return _tableView;
}
@end
