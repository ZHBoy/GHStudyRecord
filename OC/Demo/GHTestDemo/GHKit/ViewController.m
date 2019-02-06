//
//  ViewController.m
//  GHKit
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHCarouselMap.h"
#import "UITableView+GHAdd.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    NSLog(@"%@",self.tableView.ghDataArray);
    self.tableView.ghDataArray = @[@"1",@"2",@"2"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    cell.textLabel.text = [self.tableView gh_objectWithArray:self.tableView.ghDataArray AtIndex:indexPath.row];
    return cell;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
    }
    return _tableView;
}
@end
