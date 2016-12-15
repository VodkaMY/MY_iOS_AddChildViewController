//
//  PictureTableViewController.m
//  MaoYan
//
//  Created by MaoYan on 16/6/30.
//  Copyright © 2016年 Onwer. All rights reserved.
//

#import "PictureTableViewController.h"

@interface PictureTableViewController ()

@end

@implementation PictureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 设置偏移量
    self.tableView.contentInset = UIEdgeInsetsMake(64 + self.view.frame.size.height * 0.05, 0, 0, 0);
    //右侧滚动条偏移量
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.view.backgroundColor = [UIColor greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
