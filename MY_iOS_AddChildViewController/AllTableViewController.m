//
//  AllTableViewController.m
//  MaoYan
//
//  Created by MaoYan on 16/6/30.
//  Copyright © 2016年 Onwer. All rights reserved.
//

#import "AllTableViewController.h"
//#import "MJRefresh.h"
@interface AllTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMJRefresh];
#pragma mark - 设置偏移量
    self.tableView.contentInset = UIEdgeInsetsMake(64 + self.view.frame.size.height * 0.05, 0, 49, 0);
    //右侧滚动条偏移量
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
//    self.view.backgroundColor = [UIColor purpleColor];
}
-(void)createMJRefresh
{
    
    
//   MJRefreshNormalHeader * normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//       NSLog(@"上啦刷新");
//   }];
//    //隐藏最后更新
//    normalHeader.lastUpdatedTimeLabel.hidden = YES;
//    //自动隐藏
//    normalHeader.automaticallyChangeAlpha = YES;
//    //隐藏状态栏
//    normalHeader.stateLabel.hidden = YES;
//    //隐藏刷新箭头
//    normalHeader.arrowView.hidden = YES;
//    //添加控制器
//    [normalHeader addSubview:[[UISwitch alloc]init]];
    
    //设置刷新标题
//    [normalHeader setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];//下拉刷新
//    [normalHeader setTitle:@"松开可以刷新" forState:MJRefreshStatePulling];//下拉刷新
//    [normalHeader setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];//正在刷新
//    self.tableView.mj_header = normalHeader;
    
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%li",indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
